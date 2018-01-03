/* alloc7.c
*******************************************************************************
boltzmann

Pacific Northwest National Laboratory, Richland, WA 99352.

Copyright (c) 2010 Battelle Memorial Institute.

Publications based on work performed using the software should include 
the following citation as a reference:


Licensed under the Educational Community License, Version 2.0 (the "License"); 
you may not use this file except in compliance with the License. 
The terms and conditions of the License may be found in 
ECL-2.0_LICENSE_TERMS.TXT in the directory containing this file.
        
Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
CONDITIONS OF ANY KIND, either express or implied. See the License for the 
specific language governing permissions and limitations under the License.
******************************************************************************/

#include "boltzmann_structs.h"

#include "alloc7.h"

int alloc7(struct state_struct *state) {
  /*
    Allocate space for a flux vector ( lenth = num_species)
    The Jacobian of the flux vector (length = num_species * num_species);
    the reactant_term vector (length = num_rxns), 
    product_term_vector (length = num_rxns),  r_over_p, p_over_r both of 
    length num_rxns, and concs of length num_species.
    Also an integer vector, rxn_has_flux of length num_rxns.
    Called by: deq_run
    Calls:     calloc, fprintf, fflush,
  */
  double *reactant_term;
  double *product_term;
  double *p_over_r;
  double *r_over_p;
  double *ode_forward_lklhds;
  double *ode_reverse_lklhds;
  double *ode_counts;
  double *ode_concs;
  int64_t ask_for;
  int64_t one_l;
  int64_t usage;
  int    *rxn_has_flux;
  int num_rxns;
  int num_species;
  int success;
  int padi;

  one_l         = (int64_t)1;
  usage         = state->usage;
  num_species   = (int)state->nunique_molecules;
  num_rxns      = (int)state->number_reactions;
  success       = 1;
  /*
    Allocate space for the ode_counts vector to be computed
    from the molecule concentrations and compartment sizes.
  */
  if (success) {
    ask_for = num_species * sizeof(double);
    usage += ask_for;
    ode_counts = (double *)calloc(one_l,ask_for);
    if (ode_counts == NULL) {
      fprintf(stderr,"alloc7: Error unable to allocate %lld bytes for "
	      "ode_counts\n",ask_for);
      fflush(stderr);
      success = 0;
    } else {
      state->ode_counts = ode_counts;
    }
  }
  if (success) {
    ask_for = num_species * sizeof(double);
    usage += ask_for;
    ode_concs = (double *)calloc(one_l,ask_for);
    if (ode_concs == NULL) {
      fprintf(stderr,"alloc7: Error unable to allocate %lld bytes for "
	      "ode_concs\n",ask_for);
      fflush(stderr);
      success = 0;
    } else {
      state->ode_concs = ode_concs;
    }
  }
  /*
    Allocate space for the reactant_terms
  */
  if (success) {
    ask_for = num_rxns * sizeof(double);
    usage += ask_for;
    reactant_term = (double *)calloc(one_l,ask_for);
    if (reactant_term == NULL) {
      fprintf(stderr,"alloc7: Error unable to allocate %lld bytes for "
	      "reactant_term\n",ask_for);
      fflush(stderr);
      success = 0;
    } else {
      state->reactant_term = reactant_term;
    }
  }
  /*
    Allocate space for the product_term
  */
  if (success) {
    ask_for = num_rxns * sizeof(double);
    usage += ask_for;
    product_term = (double *)calloc(one_l,ask_for);
    if (product_term == NULL) {
      fprintf(stderr,"alloc7: Error unable to allocate %lld bytes for "
	      "product_term\n",ask_for);
      fflush(stderr);
      success = 0;
    } else {
      state->product_term = product_term;
    }
  }
  /*
    Allocate space for the p_over_r
  */
  if (success) {
    ask_for = num_rxns * sizeof(double);
    usage += ask_for;
    p_over_r = (double *)calloc(one_l,ask_for);
    if (p_over_r == NULL) {
      fprintf(stderr,"alloc7: Error unable to allocate %lld bytes for "
	      "p_over_r\n",ask_for);
      fflush(stderr);
      success = 0;
    } else {
      state->p_over_r = p_over_r;
    }
  }
  /*
    Allocate space for the r_over_p vector
  */
  if (success) {
    ask_for = num_rxns * sizeof(double);
    usage += ask_for;
    r_over_p = (double *)calloc(one_l,ask_for);
    if (r_over_p == NULL) {
      fprintf(stderr,"alloc7: Error unable to allocate %lld bytes for "
	      "r_over_p\n",ask_for);
      fflush(stderr);
      success = 0;
    } else {
      state->r_over_p = r_over_p;
    }
  }
  if (success) {
    ask_for = num_rxns * sizeof(double);
    usage += ask_for;
    ode_forward_lklhds = (double *)calloc(one_l,ask_for);
    if (ode_forward_lklhds == NULL) {
      fprintf(stderr,"alloc7: Error unable to allocate %lld bytes for "
	      "ode_forward_lklhds\n",ask_for);
      fflush(stderr);
      success = 0;
    } else {
      state->ode_forward_lklhds = ode_forward_lklhds;
    }
  }
  if (success) {
    ask_for = num_rxns * sizeof(double);
    usage += ask_for;
    ode_reverse_lklhds = (double *)calloc(one_l,ask_for);
    if (ode_reverse_lklhds == NULL) {
      fprintf(stderr,"alloc7: Error unable to allocate %lld bytes for "
	      "ode_reverse_lklhds\n",ask_for);
      fflush(stderr);
      success = 0;
    } else {
      state->ode_reverse_lklhds = ode_reverse_lklhds;
    }
  }
  /*
    Allocate space for the rxn_has_flux indicator vector.
    This vector is sort of a hack for now for improving mass
    conservation. We need to address mass conservation more carefully.
  */
  if (success) {
    ask_for = (num_rxns + (num_rxns & 1)) * sizeof(int);
    usage += ask_for;
    rxn_has_flux = (int*)calloc(one_l,ask_for);
    if (rxn_has_flux == NULL) {
      fprintf(stderr,"alloc7: Error unable to allocate %lld bytes for "
	      "rxn_has_flux\n",ask_for);
      fflush(stderr);
      success = 0;
    } else {
      state->rxn_has_flux = rxn_has_flux;
    }
  }
  state->usage = usage;
  return(success);
}
