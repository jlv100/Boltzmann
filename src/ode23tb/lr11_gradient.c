#include "boltzmann_structs.h"
#include "boltzmann_cvodes_headers.h"
#include "cvodes_params_struct.h"
#include "get_counts.h"
#include "conc_to_pow.h"
#include "update_regulations.h"
#include "stable_add.h"
#include "lr11_gradient.h"

int lr11_gradient(struct state_struct *state, 
				double *concs,
				double *flux, 
				int choice) {
  /*
    Compute approximations to concentration changes wrt time, 
    Based on thermodynamics formulation for concentraion rate
    changes
    using counts to compute tr, tp, pt, rt instead of concs.

    Get reference from Bill Cannon
    Called by: gradient
    Calls:     get_counts,
               conc_to_pow,
               update_regulations,
	       stable_add

                                TMF
    state                       *SI   Boltzmant state structure.
                                      uses number_reactions,
				           unique_moleules,
					   sorted_molecules,
                                           molecules_matrix,
					   ke, rke,
					   product_term as scratch.
					   and lfp,
				      

    concs			D1I   molecule concentrations vector of length 
                                      nunique_moleucles

    flux                        D1O   vector of length  unique_molecules
                                      of concentration change per unit time.
				      Set by this routine.

    choice                      IOI   Not used by this routine.

  */
  struct  cvodes_params_struct *cvodes_params;
  struct  molecule_struct *molecules;
  struct  molecule_struct *molecule;
  /*
  struct  compartment_struct *compartments;
  struct  compartment_struct *compartment;
  */
  struct  molecules_matrix_struct *molecules_matrix;
  struct  reactions_matrix_struct *rxn_matrix;
  double  *activities;
  double  *forward_lklhd;
  double  *reverse_lklhd;
  double  *rfc;
  double  *deriv_acc;
  double  *stable_add_scr;
  double  *ke;
  double  *rke;
  double  *counts;
  double  *conc_to_count;
  double  *recip_coeffs;
  double  *coefficients;
  double  *rcoefficients;
  double  *kq;
  double  *kqi;
  double  *skq;
  double  *skqi;
  int64_t *molecules_ptrs;
  int64_t *rxn_indices;
  int64_t *rxn_ptrs;
  int64_t *molecule_indices;
  double  flux_scaling;
  double  coeff;
  double  pt;
  double  rt;
  double  tr;
  double  tp;
  /*
  double  conc_mi;
  double  thermo_adj;
  double  recip_volume;
  double  recip_avogadro;
  */
  double  fluxi;
  double  count_mi;
  double  count_plus;
  double  klim;
  double  factorial;
  int num_species;
  int num_rxns;

  int rxn;
  int success;

  int i;
  int j;

  int mi;
  int irfc;

  int use_regulation;
  int count_or_conc;
  
  int ii;
  int jj;
  
  int compute_sensitivities;
  int ode_solver_choice;

  FILE *lfp;
  FILE *efp;
  /*
#define DBG 1
  */
  /*
    Check that base_rxn is in range.
  */
  success          = 1;
  num_rxns         = state->number_reactions;
  num_species      = state->nunique_molecules;
  molecules        = state->sorted_molecules;
  /*
  compartments     = state->sorted_compartments;
  */
  activities       = state->activities;
  forward_lklhd    = state->ode_forward_lklhds;
  reverse_lklhd    = state->ode_reverse_lklhds;
  molecules_matrix = state->molecules_matrix;
  molecules_ptrs   = molecules_matrix->molecules_ptrs;
  rxn_indices      = molecules_matrix->reaction_indices;
  coefficients     = molecules_matrix->coefficients;
  recip_coeffs     = molecules_matrix->recip_coeffs;
  rxn_matrix       = state->reactions_matrix;
  rxn_ptrs         = rxn_matrix->rxn_ptrs;
  molecule_indices = rxn_matrix->molecules_indices;
  rcoefficients    = rxn_matrix->coefficients;
  ke               = state->ke;
  rke              = state->rke;
  rfc              = state->rfc;
  deriv_acc        = state->deriv_acc;
  stable_add_scr   = state->stable_add_scr;
  counts           = state->ode_counts;
  conc_to_count    = state->conc_to_count;
  use_regulation   = state->use_regulation;
  ode_solver_choice = state->ode_solver_choice;
  kq               = state->ode_kq;
  kqi              = state->ode_kqi;
  skq              = state->ode_skq;
  skqi             = state->ode_skqi;
  factorial       = 0.0;
  compute_sensitivities = state->compute_sensitivities;
  if ((ode_solver_choice == 1) && compute_sensitivities) {
    cvodes_params = state->cvodes_params;
    ke = cvodes_params->p;
    rke = cvodes_params->rp;
    for (i=0;i<num_rxns;i++) {
      rke[i] = 1.0/ke[i];
    }
  }
  /*
  recip_avogadro   = state->recip_avogadro;
  */
  /*
  flux_scaling     = compute_flux_scaling(state,concs);
  */
  get_counts(num_species,concs,conc_to_count,counts);
  flux_scaling     = 1.0;
  lfp      = state->lfp;
  /*
    As per discusion with Bill Cannon, we want to update the activities
    if reguation is in play. So do that here.
  */
  if (use_regulation) {
    count_or_conc = 0;
    update_regulations(state,concs,count_or_conc);
  }
  /*
    Compute the reaction flux contributions for each reaction:

    rfc   = k_f * product of reactants^stoichiometric_coef -
            k_r * product of products^stoichiometric_coef,

	 where k_f = k_eq/ thermo_product of products.

	 and   k_r  = k_eq^(-1)/thermo_product of reactants,

	 and thermo_product = 
	 product( species_conc + |stoichiometric_coef|/volume)^|stoichiometric coef|.

	 Then if a molecule is in rxn i,

	 rxn i contributes 1/stoichiometric_coef * rfc[i] to the molcule's flux.
         here we include the sign with the stoichiometric_coef, so for
	 reactants the rfc contribution is subtracted, and for products it
	 is added.
  */
  ii = 0;
  for (i=0;i<num_rxns;i++) {
    pt = 1.0;
    rt = 1.0;
    tr = 1.0;
    tp = 1.0;
    for (j=rxn_ptrs[i];j<rxn_ptrs[i+1];j++) {
      mi = molecule_indices[j];
      /*
      molecule = (struct molecule_struct *)&molecules[mi];
      ci = molecule->c_index;
      compartment = (struct compartment_struct *)&compartments[ci];
      recip_volume       = compartment->recip_volume;
      */
      klim = coefficients[j];
      count_mi = counts[mi];
      if (klim < 0.0) {
	klim = 0.0 - klim;
	count_plus = count_mi + klim;
	rt = rt * conc_to_pow(count_mi,klim,factorial);
	tr = tr * conc_to_pow(count_plus,klim,factorial);
	/*
	for (k=0;k<(-klim);k++) {
	  rt = rt * count_mi;
	  tr = tr * (count_mi - klim);
	}
	*/
      } else {
	if (klim > 0.0) {
	  count_plus = count_mi + klim;
	  pt         = pt * conc_to_pow(count_mi,klim,factorial);
	  tp         = tp * conc_to_pow(count_plus,klim,factorial);
	  /*
	  for (k=0;k<klim;k++) {
	    pt = pt * count_mi;
	    tp = tp * (count_mi + klim);
	  }
	  */
	}
      }
    }
    /*
      NB. tp and tr will always be > 0 as |klim| > 0 and concs_mi >= 0;
      but now the reaction contribution is in counts per time, if we
      want it in moles/liter/time we need to divide by volume and
      avogadro's number - wonder if we really need these two multiplies??
    rfc[i] = (ke[i] * (rt/tp)) - (rke[i] * (pt/tr)) * recip_volume * recip_avogadro;
    */
    /*
      Save likelihoods for printing.
    */
    forward_lklhd[i] = ke[i] * (rt/tp);
    reverse_lklhd[i] = rke[i] * (pt/tr);
    /*
    rfc[i] = (ke[i] * (rt/tp)) - (rke[i] * (pt/tr));
    NB if use_activities is not set activities[i] will be 1.0 for all i.
    */
    /*
    rfc[i] = (forward_lklhd[i] - reverse_lklhd[i]) * activities[i];
    */
    rfc[ii] = forward_lklhd[i] * activities[i];
    rfc[ii+1] = -reverse_lklhd[i] * activities[i];
    kq[i] = forward_lklhd[i];
    kqi[i] = reverse_lklhd[i];
    skq[i] = kq[i] * activities[i];
    skqi[i] = kqi[i] * activities[i];
    ii += 2;
  } /* end for (i... ) */
  if (success) {
    molecule = molecules;
    for (i=0;i<num_species;i++) {
      fluxi = 0.0;
      if (molecule->variable == 1) {
	jj = 0;
	for (j=molecules_ptrs[i];j<molecules_ptrs[i+1];j++) {
	  rxn = rxn_indices[j];
	  irfc = rxn + rxn;
	  coeff = coefficients[j];
	  if (coeff != 0.0) {
	    /*
	    fluxi += (rfc[rxn]/((double)coefficients[j]));
	    */
	    deriv_acc[jj]   = rfc[irfc]*coeff;
	    deriv_acc[jj+1] = rfc[irfc+1]*coeff;
	    jj              += 2;
	  }
	} /* end for(j...) */
	/*
	  Now add the first jj elements of deriv_acc to get fluxi 
	  in a stable way.
	*/
	fluxi   = stable_add(jj,deriv_acc,stable_add_scr);
	flux[i] = flux_scaling * fluxi;
      } else {
	flux[i] = 0.0;
      }
      molecule += 1; /* Caution address arithmetic here. */
    } /* end for (i...) */
  } /* end if success */
#ifdef DBG
  if (lfp) {
    fprintf(lfp,"Mol_index\t   conc   \t    flux\n");
    for (i=0;i<num_species;i++) {
      fprintf(lfp,"%d\t%le\t%le\n",
	      i,concs[i],flux[i]);
    }
    fflush(lfp);
  }
#endif
  return (success);
}
