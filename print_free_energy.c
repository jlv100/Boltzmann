/* print_free_energy.c
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
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <float.h>
#include <math.h>
#include <signal.h>
#include <unistd.h>

#include "djb_timing_b.h"
#include "boltzmann_structs.h"

#include "print_free_energy.h"
void print_free_energy(struct state_struct *state, int step) {
  /*
    For recording step, print the free energies to the free 
    energy file according to the free_energy_format field of state.

    Called by: boltzmann_run_sim
    calls    : fprintf

    Arguments:
      Name           TMF        Description
      state          G*I        state structure. No fields are modified.
                                Fields used are free_energy_format,
				free_energy_fp, number_reactions, 
				free_energy, forward_rxn_log_likelihood_ratio,
				and cal_gm_per_joule

      step           ISI        The recording step number.
  */
  double *forward_rxn_log_likelihood_ratio;
  double *free_energy;
  double cal_gm_per_joule;
  double fe;
  int free_energy_format;
  int number_reactions;
  int j;
  int padi;
  FILE *free_energy_fp;
  
  free_energy_format 		   = state->free_energy_format;
  free_energy_fp     		   = state->free_energy_fp;
  number_reactions    		   = state->number_reactions;
  free_energy                      = state->free_energy;
  forward_rxn_log_likelihood_ratio = state->forward_rxn_log_likelihood_ratio;
  cal_gm_per_joule  	           = state->cal_gm_per_joule;
  if (free_energy_fp) {
    fprintf(free_energy_fp,"%d",step);
    if (free_energy_format == 1) {
      for (j=0;j<number_reactions;j++) {
	fprintf(free_energy_fp,"\t%le",
		-forward_rxn_log_likelihood_ratio[j]);
      }
    }
    if (state->free_energy_format == 2) {
      for (j=0;j<number_reactions;j++) {
	fe = free_energy[j]*cal_gm_per_joule;
	fprintf(state->free_energy_fp,"\t%le",fe);
      }
    }
    if (state->free_energy_format == 3) {
      for (j=0;j<number_reactions;j++) {
	fprintf(state->free_energy_fp,"\t%le",free_energy[j]);
      }
      fprintf(state->free_energy_fp,"\n");
    }
    fprintf(state->free_energy_fp,"\n");
  }
  return;
}
