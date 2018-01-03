/* read_initial_concentrations.c
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

#include "molecules_lookup.h"
#include "compartment_lookup.h"
#include "upcase.h"

#include "read_initial_concentrations.h"
int read_initial_concentrations(struct state_struct *state) {
  /*
    Read the concs.in file for initial concentrations, and
    set the concentrations array.
    Called by: boltzmann_init
    Calls:     molecules_lookup
               compartment_lookup,
	       upcase,
               fopen, fgets, fclose, fprintf, fflush (intrinsic)
  */
  struct molecule_struct *sorted_molecules;
  struct molecule_struct *molecule;
  double  conc;
  double  conc_multiple;
  double  c_multiple;
  double *concs;
  double *bndry_flux_concs;
  int64_t molecules_buff_len;
  int64_t one_l;
  int success;
  int nzr;

  int nu_molecules;
  int i;

  int nscan;
  int variable;

  int si;
  int ci;

  int mol_len;
  int cmpt_len;

  int num_fixed_concs;
  int solvent;

  int compute_conc;
  int padi;
  
  char *molecules_buffer;
  char *molecule_name;
  char *compartment_name;
  char *variable_c;
  char *compute_c;
  char vc[2];
  char cc[2];
  char *fgp;
  
  FILE *conc_fp;
  nu_molecules       = state->nunique_molecules;
  molecules_buff_len = state->max_param_line_len;
  molecules_buffer   = state->param_buffer;
  molecule_name      = molecules_buffer + state->max_param_line_len;
  compartment_name   = molecule_name + (state->max_param_line_len>>1);
  sorted_molecules   = state->sorted_molecules;
  concs              = state->current_concentrations;
  bndry_flux_concs   = (double *)state->bndry_flux_concs;
  success = 1;
  one_l = (int64_t)1;
  variable_c = (char *)&vc[0];
  compute_c  = (char *)&cc[0];
  for (i=0;i<nu_molecules;i++) {
    concs[i] = -1.0;
    bndry_flux_concs[i] = -1;
  }
  num_fixed_concs = 0;
  conc_fp = fopen(state->init_conc_file,"r");
  if (conc_fp) {

    while (!feof(conc_fp)) {
      fgp = fgets(molecules_buffer,molecules_buff_len,conc_fp);
      if (fgp) {
	nscan = sscanf(molecules_buffer,"%s %le %1s %1s %le",
		       molecule_name, &conc, variable_c, compute_c, 
		       &c_multiple);
	variable = 1;
	solvent  = 0;
	if (nscan >= 3) {
	  /*
	    A variable or constant specifier was givven.
	  */
	  /*
	    Upper case the variable character.
          */
	  vc[0] = vc[0] & 95;

	  if (strncmp(variable_c,"F",one_l) == 0) {
	    variable = 0;
	    num_fixed_concs += 1;
	  }
	  if (strncmp(variable_c,"V",one_l) == 0) {
	    variable = 0;
	    num_fixed_concs += 1;
	    solvent  = 1;
	  }
	}
	compute_conc = 1;
	if (nscan >= 4) {
	  /*
	    A fixed or compute value was given for the initial concentration.
	    Upper case the compute value character.
	  */
	  cc[0] = cc[0] & 95;
	  if (strncmp(compute_c,"U",one_l) == 0) {
	    compute_conc = 0;
	  } else {
	    if (strncmp(compute_c,"I",one_l) == 0) {
	      compute_conc = 1;
	    } else {
	      if (strncmp(compute_c,"C",one_l) == 0) {
		compute_conc = 2;
	      } else {
		compute_conc =0;
	      }
	    }
	  }
	}
        conc_multiple = 1.0;
	if (nscan == 5) {
	  /*
	    A multiplicative factor was given for the initial concentration.
	  */
	  conc_multiple = c_multiple;
	}
	mol_len = strlen(molecule_name);
	compartment_name = molecule_name;
	for (i=0;i<mol_len-1;i++) {
	  if (molecule_name[i] == ':') {
	    compartment_name = (char *)&molecule_name[i+1];
	    molecule_name[i] = '\0';
	    cmpt_len = mol_len - i - 1;
	    mol_len = i;
	    break;
	  }
	}
	if (compartment_name == molecule_name) {
	  ci = 0;
	} else {
	  upcase(cmpt_len,compartment_name,compartment_name);
	  ci = compartment_lookup(compartment_name,state);
	}
	if (nscan >= 2) {
	  upcase(mol_len,molecule_name,molecule_name);
	  si = molecules_lookup(molecule_name,ci,state);
	  if ((si >=0) && si < nu_molecules) {
	    concs[si] = conc;
	    molecule = (struct molecule_struct *)&sorted_molecules[si];
	    molecule->variable = variable;
	    molecule->compute_init_conc = compute_conc;
	    molecule->conc_multiple     = conc_multiple;
	    molecule->solvent           = solvent;
	  } else {
	    fprintf(stderr,"read_initial_concentrations: Error "
		    "unrecognized molecule in %s was %s\n",
		    state->init_conc_file,molecule_name);
	    fflush(stderr);
	    success = 0;
	    break;
	  }
	} else {
	  fprintf(stderr,"read_initial_concentrations: Error "
		  "poorly formated line was\n%s\n",molecules_buffer);
	  fflush(stderr);
	  success = 0;
	}
      } /* end if (fgp) */
    } /* end while (!feof(conc_fp)) */
    fclose(conc_fp);
  } else {
    fprintf(stderr,
	    "read_initial_concentrations: Warning unable to open %s\n",
	    state->init_conc_file);
    fflush(stderr);
    success = 0;
  }
  if (success) {
    conc = state->default_initial_conc;
    for (i=0;i<nu_molecules;i++) {
      if (concs[i] < 0.0) {
	concs[i] = conc;
      }
    }
    for (i=0;i<nu_molecules;i++) {
      bndry_flux_concs[i] = concs[i];
    }
    state->num_fixed_concs = num_fixed_concs;
    /*
      Print the initial concentrations to the concentrations output file.
    */
    if (state->print_output) {
      if (state->concs_out_fp) {
	fprintf(state->concs_out_fp,"init");
	for (i=0;i<nu_molecules;i++) {
	  fprintf(state->concs_out_fp,"\t%le",concs[i]);
	}
	fprintf(state->concs_out_fp,"\n");
      } else {
	fprintf(stderr,
		"read_initial_concentrations: Error concs_out_fp not open\n");
	fflush(stderr);
	success = 0;
      }
    }
  }
  return(success);
}
