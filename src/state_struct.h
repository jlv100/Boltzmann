/* state_struct.h 
*/
#ifndef __STATE_STRUCT__
#define __STATE_STRUCT__ 1
/* 
  So we will lay out the state struct a little differently.
  We want to flatten the state structure, and make it self describing.
  At the beginning there will be a set of scalars describing sizes
  and constansts to be used in the code, followed by a partitioning

  Let us make the following partitions
  1, for the size parameters and floating point constants.

  2. for arrays/structs that are both inputs and outputs (4 of these)
     current_concentrations,
     bndry_flux_concs,
     vgrng_state
     vgrng2_state
     and 2 scalars, dg_forward and entropy for the whole system
 
  3. for arrays/structs that are strictly inputs (there are 13 of these
     not counting string pointers).
     reactions,
     reactions_matrix,
     sorted_molecules,
     ke,
     kss,
     kssr,
     activities,
     sorted_compartments

     Each of following 4 arrays of length max_regs_per_rxn * num_reactions
     reg_species,   (int64_t)
     reg_drctn,     (int64_t)
     reg_constant,  (double)
     reg_exponent,  (double)

  4. for work space arrays and structs.
     unsorted_molecules,
     unsorted_cmpts.
     future_concentrations,
     rxn_fire,
     no_op_likelihood,
     forward_rxn_likelihood,
     reverse_rxn_likelihood,
     forward_rxn_log_likelihood_ratio,
     reverse_rxn_log_likelihood_ratio,
     rxn_likelihood_ps,
     rxn_view_likelihoods,
     rev_rxn_view_likelihoods,
     dg0s,
     free_energy,


  a partition would have a number of entities as an 8 byte first element,
  a total length for the second 8 byte element followed by 
  offset, length pairs for each of the entities. 
  followed by the entities.

  So the super partition would look like 

    4L 
    total_length_in_8_byte_words_of_the_state_struct
    10L
    total_length_in_8byte_words_of_partition_1_size_params_and_fp_constants

    10 + total_length_in_8byte_words_of_partition_1_size_params_and_fp_constants    
    total_length_in_8byte_words_of_partition_2_2way_data

    10 + total_length_in_8byte_words_of_partition_1_size_params_and_fp_constants    +     total_length_in_8byte_words_of_partition_2_2way_data
    total_length_in_8byte_words_of_partition_3_input_data

    10 + total_length_in_8byte_words_of_partition_1_size_params_and_fp_constants    +     total_length_in_8byte_words_of_partition_2_2way_data
    +     total_length_in_8byte_words_of_partition_3_input_data
    total_length_in_8byte_words_of_partition_4_workspace.


    Partition 1 is a little different in that all the quantities are
    scalars, we will make them all 8 byte quantites.

    This struct is allocated in alloc0.
*/
struct state_struct {
  int64_t state_length; 
  int64_t flattened_size;         	
  int64_t version_no;
  int64_t agent_type;
  int64_t mpi_rank;
  int64_t thread_id;
  int64_t current_counts_offset;
  double  x_coord;
  double  y_coord;
  double  z_coord;
  int64_t agent_data_length;

  int64_t number_reactions;     	
  int64_t number_molecules;            
  int64_t nunique_molecules;     	
  int64_t use_activities;       	
  int64_t use_deq;
  int64_t no_round_from_deq;
  int64_t adjust_steady_state;
  int64_t molecules_or_conc;      
  int64_t ode_solver_choice;
  int64_t gradient_choice;
  int64_t warmup_steps;           
  int64_t record_steps;           
  int64_t print_output;
  int64_t print_concs_or_counts;
  int64_t number_compartments;  	
  int64_t nunique_compartments;  	
  int64_t align_len;
  int64_t align_mask;
  int64_t max_filename_len;
  int64_t free_energy_format;
  int64_t rxn_view_freq;
  int64_t rxn_view_hist_length;
  int64_t ode_rxn_view_freq;
  int64_t lklhd_view_freq;
  int64_t count_view_freq;
  int64_t fe_view_freq;
  int64_t reaction_file_length;
  int64_t num_fixed_concs;
  int64_t usage;
  int64_t max_molecule_len;
  int64_t min_molecule_len;
  int64_t max_compartment_len;
  int64_t min_compartment_len;
  int64_t sum_molecule_len;
  int64_t sum_compartment_len;
  int64_t num_files;
  int64_t solvent_pos;
  int64_t use_pseudoisomers;
  int64_t use_dgzero;
  int64_t use_metropolis;
  int64_t use_regulation;
  int64_t max_regs_per_rxn;
  int64_t output_filename_base_length;
  int64_t base_reaction;
  int64_t number_base_reaction_reactants;
  int64_t print_ode_concs;
  /*
    sizes used to self-describe this state vector.
    only needed for parallel version multiple instantiations
    when using boltzmann_boot and boltzmann_load, with flatten_state.
  */
  int64_t keyword_buffer_length;
  int64_t max_num_rxn_file_keywords;
  int64_t num_rxn_file_keywords;
  int64_t rxn_file_keyword_len;
  int64_t max_param_line_len;
  int64_t reaction_titles_length;
  int64_t pathway_text_length;
  int64_t compartment_text_length;
  int64_t molecule_text_length;
  int64_t regulation_text_length;
  int64_t run_workspace_bytes;
  int64_t use_bulk_water;
  int64_t cvodes_rhs_choice;
  int64_t cvodes_jtimes_choice;
  int64_t cvodes_prec_choice;
  int64_t cvodes_params_size;
  int64_t ode23tb_params_size;
  int64_t ode_jacobian_choice;
  int64_t cvodes_prec_fill;
  int64_t ode_stop_norm; /* 0 for infinity(max), 1 for 1(sum abs), 2 for Euclidian.*/
  int64_t ode_stop_rel;  /* 0 for absolute  1 for relative */
  int64_t ode_stop_style; /*0 for termination time, 1 for adaptive */
  int64_t compute_sensitivities; 
  int64_t use_lsqnonlin;
  /* 0 for no, 1 for yes, only when ode_solver_choice == 1 */
  /*
    offsets used to self-describe this state vector.
    only needed for parallel version multiple instantiations
    when using boltzmann_boot and boltzmann_load, with flatten_state.
  */
  /*
    Floating point scalars
  */
  double  epsilon; /* used in choose_rxn */
  double  ideal_gas_r;
  double  temp_kelvin;
  double  avogadro;
  double  recip_avogadro;
  double  min_count;
  double  min_conc;
  double  ph;
  double  ionic_strength;
  double  rt;
  double  m_r_rt;
  double  m_rt;
  double  cals_per_joule;
  double  joules_per_cal;
  double  default_initial_count;
  double  dg_forward;
  double  entropy;
  double  current_concentrations_sum;
  double  default_volume;
  double  recip_default_volume;
  double  conc_units;
  double  ntotal_opt;
  double  ntotal_exp;
  double  ode_t_final;
  /* 
    max_log_g0_sum should be set to maximum argument allowed for
    exp function, for double precision about 704
  */
  double  max_log_g0_sum; 
  double  dg0_scale_factor;
  /*
    Note that flux_scaling is K_f(base_rxn_reaction)*(product of reactant 
    concentrations in base reaction).
  */
  double  kf_base_reaction;
  /*
    Flux scaling, if 0 then use kf_base_raction * product of base reaction 
    reactant species concentratiopns, else use fixed FLUX_SCALING.
  */
  double  flux_scaling;
  /*
    min_molecule_dg0tf is the smallest dg0 of formation from molecules 
    computed in compute_moldeule_dg0tfs and used in 
    compute_moleculear_partition_probability.
  */
  double  min_molecule_dg0tf;
  /*
    derivative threshold, value at which derivative if less than is set to 0.
  */
  double deriv_thresh;
  /*
    ode stopping threshold: when the derivative vector norm is less than
    ode_stop_thresh, terminate the ode method even if the ode_t_final has
    not yet been reached. See also ode_stop_norm, ode_stop_rel, and 
    ode stop_style
  */
  double ode_stop_thresh; 
  /*
    Numerical Jacobian threshold for ode_num_jac thresh vector initialization.
  */
  double nj_thresh;


  int64_t *workspace_base;

  /* two way data (modified) */
  double  *current_counts; /* len = unique_molecules */
  double  *bndry_flux_counts;       /* len = unique_molecules */
  double  *net_lklhd_bndry_flux;    /* len = unique_molecules */
  double  *net_likelihood;          /* len = number_reactions */
  struct  vgrng_state_struct *vgrng_state; /* len = 16 */
  struct  vgrng_state_struct *vgrng2_state;/* len = 16 */ 
  struct  cvodes_params_struct *cvodes_params; /* len = 168, round up to 256 */
  struct  ode23tb_params_struct *ode23tb_params; /* len = 96 round up to 128 */
  /* 
    (2 + (3*unique_molecules)+ number_reactions) * sizeof(double) 
    + 2 * sizeof(vgrng_state_struct)
  */
  /*
    Incoming data not modified, depends only on agent type.
    (9*number_reactions + 7*unique_molecules) * sizeof(double)
    + 2*number_reactions * max_regs_per_rxn * sizeof(double)
    + 2*number_reactions * max_regs_per_rxn * sizeof(int64_t)
        =
    (number_reactions*(5+4*max_regs_per_rxn) + 5*unique_molecules)*sizeof(double)
  */
  double  *dg0s;      /* len = number_reactions  */
  double  *ke;        /* len = number_reactions  */
  double  *rke;       /* len = number_reactions  */
  double  *forward_rc;  /* len = number_reactions */
  double  *reverse_rc;  /* len = number_reactions */
  double  *kss;       /* len = number_reactions  */
  double  *kssr;       /* len = number_reactions  */
  double  *kss_e_val; /* len = unique_molecules  */
  double  *kss_u_val; /* len = unique_molecules  */
  double  *molecule_dg0tfs; /* len = unique_molecules */
  double  *count_to_conc; /* len = unique_molecules */
  double  *conc_to_count; /* len = unique_molecules */
  double  *activities;   /* len = number_reactions */
  double  *enzyme_level; /* len = number_reactions */
  double  *reg_constant; /* len = number_reactions * max_regs_per_rxn */
  double  *reg_exponent; /* len = number_reactions * max_regs_per_rxn */
  double  *reg_drctn;    /* len = number_reactions * max_regs_per_rxn */
  double  *dfdke_dfdmu0_work; /* len = 3*unique_molecules */
  double  *coeff_sum;    /* len = number_reactions */
  int64_t *reg_species;  /* len = number_reactions * max_regs_per_rxn */
  int     *use_rxn;      /* Vector of flags of length number_reactions
	 		   indicating whether the reaction is to be included
			   1 for use, 0 for ignore, default value is 1.
			   Turn off by adding a USE_RXN 0 line in the
			   reaction .dat file for each reaction to be
			   turned off.
		         */
  int     *dg0tfs_set;   /* len = number_reactions + (number_reactions & 1) */
  /* 
     sizeof(reaction_struct) * number of reactions. 
     Allocated in alloc2 
  */
  struct reaction_struct *reactions; 
  /* 
    sizeof(molecule_struct) * unique_molecules 
    allocated in alloc2 
  */
  struct molecule_struct *sorted_molecules;  
  /* 
     sizeof(compartment_struct) * unique_compartments 
     allocated in alloc2 
  */ 
  struct compartment_struct *sorted_compartments; 
  /* 
     reactions_matrix size is ((number_reactions + 1) * sizeof(int64_t)) +
     number_molecules * (4*sizeof(int64_t)) 
     allocated in alloc2 
  */
  struct reactions_matrix_struct *reactions_matrix; /* */

  /*
    molecules_matrix is allocated in alloc4.
  */
  struct molecules_matrix_struct *molecules_matrix;
  /*
    Auxilliary data read in by boltzmann_init, not needed by
    boltzman_run unless printing is enabled.
    These strings are allocated in alloc0.
  */
  char *params_file;       /* max_filename_len */
  char *reaction_file;     /* max_filename_len */
  char *init_conc_file;    /* max_filename_len */
  char *input_dir;         /* max_filename_len */
  char *output_file;       /* max_filename_len */
  char *log_file;          /* max_filename_len */
  char *output_dir;        /* max_filename_len */
  char *counts_out_file;   /* max_filename_len */
  char *ode_concs_file;    /* max_filename_len */
  char *net_lklhd_file;    /* max_filename_len */
  char *nl_bndry_flx_file; /* max_filename_len */
  char *rxn_lklhd_file;    /* max_filename_len */
  char *free_energy_file;  /* max_filename_len */
  char *restart_file;      /* max_filename_len */
  char *rxn_view_file;     /* max_filename_len */
  char *bndry_flux_file;   /* max_filename_len */
  char *pseudoisomer_file; /* max_filename_len */
  char *compartments_file; /* max_filename_len */
  char *sbml_file;         /* max_filename_len */
  char *ms2js_file;        /* max_filename_len */
  char *kg2js_file;        /* max_filename_len */
  char *rxn_echo_file;     /* max_filename_len */
  char *rxn_mat_file;      /* max_filename_len */
  char *dg0ke_file;        /* max_filename_len */
  char *dictionary_file;   /* max_filename_len */
  char *ode_grad_file;   /* max_filename_len */
  char *ode_lklhd_file;    /* max_filename_len */
  char *ode_bflux_file;    /* max_filename_len */
  char *concs_out_file;    /* max_filename_len */
  char *aux_data_file;     /* max_filename_len */
  char *ode_counts_file;   /* max_filename_len */
  char *ode_sens_file;     /* max_filename_len */
  char *ode_dsens_file;    /* max_filename_len */
  char *dfdke_file;        /* max_filename_len */
  char *dfdmu0_file;       /* max_filename_len */
  char *arxn_mat_file;     /* max_filename_len */
  char *cmpts_echo_file;   /* max_filename_len */
  char *ode_kq_file;       /* max_filename_len */
  char *ode_skq_file;      /* max_filename_len */
  
  char *solvent_string;    /* Length is 64. Allocated in alloc0 */

  char *rxn_title_text;    /* rxn_title_text_length. Allocated in alloc2  */
  char *pathway_text;      /* pathway_text_length. Allocated in alloc2    */
  char *compartment_text;  /* compartment_text_length Allocated in alloc2 */
  char *molecules_text;    /* molecule_text_length Allocated in alloc2 */
  char *regulation_text;    /* regulation_text_length Allocated in alloc2 */
  /*
    Workspace only.
  */
  struct molecule_struct *unsorted_molecules; /* allocated in alloc2 */
  struct compartment_struct *unsorted_cmpts; /* allocated in alloc2 */
  int64_t *compartment_ptrs;                 /* allocated in alloc3 */
  int64_t *transpose_workspace;  /* used in forming molecules_matrix. */
                                 /* allocated in alloc4 */
  int64_t *rxn_file_keyword_lengths /* allocated in alloc0 */;
  char    **rxn_file_keywords; /* 16, allocated in alloc0 */
  char    *rxn_file_keyword_buffer; /* 256, allocated in alloc0  */
  char    *param_buffer; /*  2* max_param_line_len, allocated in alloc0 */ 
  char    *raw_molecules_text; /* molecule_text_length Allocated in alloc2 */
  /* 
    Allocated in alloc8.
  */
  double  *future_counts;      /* unique_molecules */
  double  *free_energy;            /* number_reactions */
  double  *forward_rxn_likelihood; /* number_reactions */
  double  *reverse_rxn_likelihood; /* number_reactions */
  double  *forward_rxn_log_likelihood_ratio; /* number_reactions */
  double  *reverse_rxn_log_likelihood_ratio; /* number_reactions */
  double  *rxn_likelihood_ps;      /* number_reactions + 1 */

  /* Workspace used by ode routines. Allocated in alloc7 */
  double *reactant_term; /* product of reaction reactant concentrations, length number_reactions */
  double *product_term;  /* product of reaction product concentrations, length number_reactions */
  double *rxn_q; /* Ratio  product_term to reactant_term.  */
  double *recip_rxn_q;/* Ratio of reactant_term to product_term. */
  double *rfc;
  double *deriv_acc;
  double *stable_add_scr;
  double *log_kf_rel;
  double *log_kr_rel;
  double *ode_counts; /* counts from concentrations */
  double *ode_concs;  /* concentrations from counts. */
  double *ode_f;      /* vector used for computing delta concs for printing */
  double *ode_kq;
  double *ode_kqi;
  double *ode_skq;
  double *ode_skqi;
  double *ode_forward_lklhds;
  double *ode_reverse_lklhds;
  int *rxn_has_flux; /* Indicator as to whether a reaction contributes to 
		       species flux  length is number_reactions */
  int  *base_reactants;            /* List of reactant species (by number)
				      in the base reaction */
  int  *base_reactant_indicator;   /* vector of length nunique_molecules
				      elment i 1 for species i in
				      base_reactants list, 0 otherwise. */
  /*
    Workspace only if printing. (debugging);
    allocated in alloc9.
  */
  double  *no_op_likelihood;       /* rxn_view_hist_length */
  /* rxn_view_hist_length * number_reactions */
  double  *rxn_view_likelihoods;    
  /* rxn_view_hist_length * number_reactions */
  double  *rev_rxn_view_likelihoods; 
  double  *rxn_mat_row;               /* (nunique_molecules) */
  int64_t *rxn_fire;                  /* (number_reactions * 2) + 2*/
  int  *cmpt_tracking;             /* number_compartments */


  FILE *rxn_fp;
  FILE *conc_fp;

  FILE *out_fp;
  FILE *lfp;

  FILE *counts_out_fp;
  FILE *concs_out_fp;

  FILE *ode_concs_fp;
  FILE *net_lklhd_fp;

  FILE *nl_bndry_flx_fp;
  FILE *rxn_lklhd_fp;

  FILE *free_energy_fp;
  FILE *restart_fp;

  FILE *rxn_view_fp;
  FILE *bndry_flux_fp;

  FILE *cmpt_fp;
  FILE *ode_grad_fp;

  FILE *ode_lklhd_fp;
  FILE *ode_bflux_fp;

  FILE *ode_counts_fp;
  FILE *aux_data_fp;

  FILE *ode_sens_fp;
  FILE *ode_dsens_fp;

  FILE *dfdke_fp;
  FILE *dfdmu0_fp;

  FILE *cmpts_echo_fp;
  FILE *ode_kq_fp;

  FILE *ode_skq_fp;
  FILE *efp;
}
;
#endif
