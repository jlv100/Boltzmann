# Makefile.in generated by automake 1.9.6 from Makefile.am.
# Makefile.  Generated from Makefile.in by configure.

# Copyright (C) 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002,
# 2003, 2004, 2005  Free Software Foundation, Inc.
# This Makefile.in is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.


srcdir = .
top_srcdir = .

pkgdatadir = $(datadir)/sss
pkglibdir = $(libdir)/sss
pkgincludedir = $(includedir)/sss
top_builddir = .
am__cd = CDPATH="$${ZSH_VERSION+.}$(PATH_SEPARATOR)" && cd
INSTALL = /usr/bin/install -c
install_sh_DATA = $(install_sh) -c -m 644
install_sh_PROGRAM = $(install_sh) -c
install_sh_SCRIPT = $(install_sh) -c
INSTALL_HEADER = $(INSTALL_DATA)
transform = $(program_transform_name)
NORMAL_INSTALL = :
PRE_INSTALL = :
POST_INSTALL = :
NORMAL_UNINSTALL = :
PRE_UNINSTALL = :
POST_UNINSTALL = :
DIST_COMMON = README $(am__configure_deps) $(srcdir)/Makefile.am \
	$(srcdir)/Makefile.body $(srcdir)/Makefile.head \
	$(srcdir)/Makefile.in $(top_srcdir)/configure AUTHORS COPYING \
	ChangeLog INSTALL NEWS install-sh missing
subdir = .
ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
am__aclocal_m4_deps = $(top_srcdir)/configure.ac
am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
	$(ACLOCAL_M4)
am__CONFIG_DISTCLEAN_FILES = config.status config.cache config.log \
 configure.lineno configure.status.lineno
mkinstalldirs = $(install_sh) -d
CONFIG_CLEAN_FILES =
SOURCES =
DIST_SOURCES =
DISTFILES = $(DIST_COMMON) $(DIST_SOURCES) $(TEXINFOS) $(EXTRA_DIST)
distdir = $(PACKAGE)-$(VERSION)
top_distdir = $(distdir)
am__remove_distdir = \
  { test ! -d $(distdir) \
    || { find $(distdir) -type d ! -perm -200 -exec chmod u+w {} ';' \
         && rm -fr $(distdir); }; }
DIST_ARCHIVES = $(distdir).tar.gz
GZIP_ENV = --best
distuninstallcheck_listfiles = find . -type f -print
distcleancheck_listfiles = find . -type f -print
ACLOCAL = ${SHELL} /home/dbaxter/boltzmann/trunk/missing --run aclocal-1.9
AMDEP_FALSE = #
AMDEP_TRUE = 
AMTAR = ${SHELL} /home/dbaxter/boltzmann/trunk/missing --run tar
AUTOCONF = ${SHELL} /home/dbaxter/boltzmann/trunk/missing --run autoconf
AUTOHEADER = ${SHELL} /home/dbaxter/boltzmann/trunk/missing --run autoheader
AUTOMAKE = ${SHELL} /home/dbaxter/boltzmann/trunk/missing --run automake-1.9
AWK = gawk
CC = gcc
CCDEPMODE = depmode=none
CFLAGS = ${OPT_FLAGS} ${DBG_FLAGS}
CPP = gcc -E
CPPFLAGS = 
CYGPATH_W = echo
DEFS = -DPACKAGE_NAME=\"sss\" -DPACKAGE_TARNAME=\"sss\" -DPACKAGE_VERSION=\"0.1\" -DPACKAGE_STRING=\"sss\ 0.1\" -DPACKAGE_BUGREPORT=\"douglas.baxter@pnl.gov\" -DPACKAGE=\"sss\" -DVERSION=\"0.1\" 
DEPDIR = .deps
ECHO_C = 
ECHO_N = -n
ECHO_T = 
EXEEXT = 
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_PROGRAM = ${INSTALL}
INSTALL_SCRIPT = ${INSTALL}
INSTALL_STRIP_PROGRAM = ${SHELL} $(install_sh) -c -s
LDFLAGS = 
LIBOBJS = 
LIBS =  libboltzmann.a -lm 
LTLIBOBJS = 
MAKEINFO = ${SHELL} /home/dbaxter/boltzmann/trunk/missing --run makeinfo
MMAP_CONFIG = no_
MPI_EXECS = 
OBJEXT = o
PACKAGE = sss
PACKAGE_BUGREPORT = douglas.baxter@pnl.gov
PACKAGE_NAME = sss
PACKAGE_STRING = sss 0.1
PACKAGE_TARNAME = sss
PACKAGE_VERSION = 0.1
PATH_SEPARATOR = :
SERIAL_EXECS = boltzmann boltzmann_boot_test rxn_map libboltzmann.a
SET_MAKE = 
SHELL = /bin/sh
STRIP = 
TIMING_CONFIG = no_
VERSION = 0.1
ac_ct_CC = gcc
ac_ct_STRIP = 
am__fastdepCC_FALSE = 
am__fastdepCC_TRUE = #
am__include = include
am__leading_dot = .
am__quote = 
am__tar = ${AMTAR} chof - "$$tardir"
am__untar = ${AMTAR} xf -
bindir = ${exec_prefix}/bin
build_alias = 
datadir = ${prefix}/share
exec_prefix = ${prefix}
host_alias = 
includedir = ${prefix}/include
infodir = ${prefix}/info
install_sh = /home/dbaxter/boltzmann/trunk/install-sh
libdir = ${exec_prefix}/lib
libexecdir = ${exec_prefix}/libexec
localstatedir = ${prefix}/var
mandir = ${prefix}/man
mkdir_p = mkdir -p --
oldincludedir = /usr/include
prefix = /usr/local
program_transform_name = s,x,x,
sbindir = ${exec_prefix}/sbin
sharedstatedir = ${prefix}/com
sysconfdir = ${prefix}/etc
target_alias = 
CLINKER = gcc
MPICC = gcc
MPICCLINKER = gcc
AS = @AS@
AR = ar
ARFLAGS = -crv
FLIBS = @FLIBS@
EXECS =  boltzmann boltzmann_boot_test rxn_map libboltzmann.a
FFLAGS = @FFLAGS@
ASFLAGS = @ASFLAGS@
DBG_FLAGS = 
OPT_FLAGS = -O0 -g -DLINUX
NO_OPT_FLAGS = -O0 -g -DLINUX
BLFLAGS =  
BCFLAGS = -O0 -g -DLINUX 
LFLAGS = ${BLFLAGS} 
NO_OPT_CFLAGS = ${BCFLAGS} ${DBG_FLAGS}
DCFLAGS = ${NO_OPT_CFLAGS} 
DLFLAGS = ${BLFLAGS} 
TIMING_DEPS = timingi.h djb_timing_b.h djb_timing.h
LUNWIND_DEPS = luwtb.h luwtb1.h luwtb2.h
SERIAL_INCS = boltzmann_structs.h super_state_struct.h super_state_pointers_struct.h state_struct.h rxn_struct.h rxn_matrix_struct.h molecules_matrix_struct.h vgrng_state_struct.h $(TIMING_DEPS) $(LUNWIND_DEPS)
SERIAL_OBJS1 = boltzmann_boot.o boltzmann_mmap_superstate.o flatten_super_state.o boltzmann_boot_check.o boltzmann_rep_state_i.o boltzmann_init.o alloc0.o boltzmann_set_filename_ptrs.o read_params.o open_output_files.o vgrng_init.o vgrng.o echo_params.o size_rxns_list.o size_rxns_file.o init_rxn_file_keywords.o parse_rxn_file_keyword.o count_molecules.o count_ws.o count_nws.o is_a_coef.o alloc2.o parse_reactions_file.o parse_side_line.o upcase.o find_colon.o echo_reactions_file.o sort_molecules.o merge_molecules.o unique_molecules.o unique_molecules_core.o sort_compartments.o merge_compartments.o unique_compartments.o unique_compartments_core.o translate_compartments.o print_molecules_dictionary.o alloc3.o set_compartment_ptrs.o read_initial_concentrations.o compartment_lookup.o molecules_lookup.o compute_ke.o print_rxn_likelihoods_header.o print_free_energy_header.o flatten_state.o free_boot_state.o free_boot_state2.o sort_global_compartments.o sort_global_molecules.o
SERIAL_OBJS2 = boltzmann_run.o update_rxn_log_likelihoods.o choose_rxn.o bndry_flux_update.o candidate_rxn.o rxn_likelihood.o rxn_likelihood_postselection.o rxn_log_likelihoods.o rxn_likelihoods.o binary_search_l_u_b.o rxn_conc_update.o compute_delta_g_forward_entropy_free_energy.o print_concentrations.o print_likelihoods.o save_likelihoods.o print_free_energy.o print_boundary_flux.o print_restart_file.o print_reactions_view.o

#SERIAL_OBJS3 = 
SERIAL_OBJS3 = rxn_map_init.o rxn_map_parse_start_stop_line.o rxn_map_run.o alloc4.o form_molecules_matrix.o
SERIAL_OBJS4 = boltzmann_global_to_local_concs.o boltzmann_global_to_local_fluxes.o boltzmann_local_to_global_concs.o boltzmann_local_to_global_fluxes.o size_file.o boltzmann_load.o boltzmann_number_of_reaction_files.o boltzmann_global_molecule_count.o boltzmann_length_state_i.o boltzmann_max_local_state_size.o boltzmann_size_superstate.o
all: all-am

.SUFFIXES:
.SUFFIXES: .c .f .f90 .o
am--refresh:
	@:
$(srcdir)/Makefile.in:  $(srcdir)/Makefile.am $(srcdir)/Makefile.head $(srcdir)/Makefile.body $(am__configure_deps)
	@for dep in $?; do \
	  case '$(am__configure_deps)' in \
	    *$$dep*) \
	      echo ' cd $(srcdir) && $(AUTOMAKE) --gnu '; \
	      cd $(srcdir) && $(AUTOMAKE) --gnu  \
		&& exit 0; \
	      exit 1;; \
	  esac; \
	done; \
	echo ' cd $(top_srcdir) && $(AUTOMAKE) --gnu  Makefile'; \
	cd $(top_srcdir) && \
	  $(AUTOMAKE) --gnu  Makefile
.PRECIOUS: Makefile
Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
	@case '$?' in \
	  *config.status*) \
	    echo ' $(SHELL) ./config.status'; \
	    $(SHELL) ./config.status;; \
	  *) \
	    echo ' cd $(top_builddir) && $(SHELL) ./config.status $@ $(am__depfiles_maybe)'; \
	    cd $(top_builddir) && $(SHELL) ./config.status $@ $(am__depfiles_maybe);; \
	esac;

$(top_builddir)/config.status: $(top_srcdir)/configure $(CONFIG_STATUS_DEPENDENCIES)
	$(SHELL) ./config.status --recheck

$(top_srcdir)/configure:  $(am__configure_deps)
	cd $(srcdir) && $(AUTOCONF)
$(ACLOCAL_M4):  $(am__aclocal_m4_deps)
	cd $(srcdir) && $(ACLOCAL) $(ACLOCAL_AMFLAGS)
uninstall-info-am:
tags: TAGS
TAGS:

ctags: CTAGS
CTAGS:


distdir: $(DISTFILES)
	$(am__remove_distdir)
	mkdir $(distdir)
	@srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`; \
	topsrcdirstrip=`echo "$(top_srcdir)" | sed 's|.|.|g'`; \
	list='$(DISTFILES)'; for file in $$list; do \
	  case $$file in \
	    $(srcdir)/*) file=`echo "$$file" | sed "s|^$$srcdirstrip/||"`;; \
	    $(top_srcdir)/*) file=`echo "$$file" | sed "s|^$$topsrcdirstrip/|$(top_builddir)/|"`;; \
	  esac; \
	  if test -f $$file || test -d $$file; then d=.; else d=$(srcdir); fi; \
	  dir=`echo "$$file" | sed -e 's,/[^/]*$$,,'`; \
	  if test "$$dir" != "$$file" && test "$$dir" != "."; then \
	    dir="/$$dir"; \
	    $(mkdir_p) "$(distdir)$$dir"; \
	  else \
	    dir=''; \
	  fi; \
	  if test -d $$d/$$file; then \
	    if test -d $(srcdir)/$$file && test $$d != $(srcdir); then \
	      cp -pR $(srcdir)/$$file $(distdir)$$dir || exit 1; \
	    fi; \
	    cp -pR $$d/$$file $(distdir)$$dir || exit 1; \
	  else \
	    test -f $(distdir)/$$file \
	    || cp -p $$d/$$file $(distdir)/$$file \
	    || exit 1; \
	  fi; \
	done
	-find $(distdir) -type d ! -perm -755 -exec chmod a+rwx,go+rx {} \; -o \
	  ! -type d ! -perm -444 -links 1 -exec chmod a+r {} \; -o \
	  ! -type d ! -perm -400 -exec chmod a+r {} \; -o \
	  ! -type d ! -perm -444 -exec $(SHELL) $(install_sh) -c -m a+r {} {} \; \
	|| chmod -R a+r $(distdir)
dist-gzip: distdir
	tardir=$(distdir) && $(am__tar) | GZIP=$(GZIP_ENV) gzip -c >$(distdir).tar.gz
	$(am__remove_distdir)

dist-bzip2: distdir
	tardir=$(distdir) && $(am__tar) | bzip2 -9 -c >$(distdir).tar.bz2
	$(am__remove_distdir)

dist-tarZ: distdir
	tardir=$(distdir) && $(am__tar) | compress -c >$(distdir).tar.Z
	$(am__remove_distdir)

dist-shar: distdir
	shar $(distdir) | GZIP=$(GZIP_ENV) gzip -c >$(distdir).shar.gz
	$(am__remove_distdir)

dist-zip: distdir
	-rm -f $(distdir).zip
	zip -rq $(distdir).zip $(distdir)
	$(am__remove_distdir)

dist dist-all: distdir
	tardir=$(distdir) && $(am__tar) | GZIP=$(GZIP_ENV) gzip -c >$(distdir).tar.gz
	$(am__remove_distdir)

# This target untars the dist file and tries a VPATH configuration.  Then
# it guarantees that the distribution is self-contained by making another
# tarfile.
distcheck: dist
	case '$(DIST_ARCHIVES)' in \
	*.tar.gz*) \
	  GZIP=$(GZIP_ENV) gunzip -c $(distdir).tar.gz | $(am__untar) ;;\
	*.tar.bz2*) \
	  bunzip2 -c $(distdir).tar.bz2 | $(am__untar) ;;\
	*.tar.Z*) \
	  uncompress -c $(distdir).tar.Z | $(am__untar) ;;\
	*.shar.gz*) \
	  GZIP=$(GZIP_ENV) gunzip -c $(distdir).shar.gz | unshar ;;\
	*.zip*) \
	  unzip $(distdir).zip ;;\
	esac
	chmod -R a-w $(distdir); chmod a+w $(distdir)
	mkdir $(distdir)/_build
	mkdir $(distdir)/_inst
	chmod a-w $(distdir)
	dc_install_base=`$(am__cd) $(distdir)/_inst && pwd | sed -e 's,^[^:\\/]:[\\/],/,'` \
	  && dc_destdir="$${TMPDIR-/tmp}/am-dc-$$$$/" \
	  && cd $(distdir)/_build \
	  && ../configure --srcdir=.. --prefix="$$dc_install_base" \
	    $(DISTCHECK_CONFIGURE_FLAGS) \
	  && $(MAKE) $(AM_MAKEFLAGS) \
	  && $(MAKE) $(AM_MAKEFLAGS) dvi \
	  && $(MAKE) $(AM_MAKEFLAGS) check \
	  && $(MAKE) $(AM_MAKEFLAGS) install \
	  && $(MAKE) $(AM_MAKEFLAGS) installcheck \
	  && $(MAKE) $(AM_MAKEFLAGS) uninstall \
	  && $(MAKE) $(AM_MAKEFLAGS) distuninstallcheck_dir="$$dc_install_base" \
	        distuninstallcheck \
	  && chmod -R a-w "$$dc_install_base" \
	  && ({ \
	       (cd ../.. && umask 077 && mkdir "$$dc_destdir") \
	       && $(MAKE) $(AM_MAKEFLAGS) DESTDIR="$$dc_destdir" install \
	       && $(MAKE) $(AM_MAKEFLAGS) DESTDIR="$$dc_destdir" uninstall \
	       && $(MAKE) $(AM_MAKEFLAGS) DESTDIR="$$dc_destdir" \
	            distuninstallcheck_dir="$$dc_destdir" distuninstallcheck; \
	      } || { rm -rf "$$dc_destdir"; exit 1; }) \
	  && rm -rf "$$dc_destdir" \
	  && $(MAKE) $(AM_MAKEFLAGS) dist \
	  && rm -rf $(DIST_ARCHIVES) \
	  && $(MAKE) $(AM_MAKEFLAGS) distcleancheck
	$(am__remove_distdir)
	@(echo "$(distdir) archives ready for distribution: "; \
	  list='$(DIST_ARCHIVES)'; for i in $$list; do echo $$i; done) | \
	  sed -e '1{h;s/./=/g;p;x;}' -e '$${p;x;}'
distuninstallcheck:
	@cd $(distuninstallcheck_dir) \
	&& test `$(distuninstallcheck_listfiles) | wc -l` -le 1 \
	   || { echo "ERROR: files left after uninstall:" ; \
	        if test -n "$(DESTDIR)"; then \
	          echo "  (check DESTDIR support)"; \
	        fi ; \
	        $(distuninstallcheck_listfiles) ; \
	        exit 1; } >&2
distcleancheck: distclean
	@if test '$(srcdir)' = . ; then \
	  echo "ERROR: distcleancheck can only run from a VPATH build" ; \
	  exit 1 ; \
	fi
	@test `$(distcleancheck_listfiles) | wc -l` -eq 0 \
	  || { echo "ERROR: files left in build directory after distclean:" ; \
	       $(distcleancheck_listfiles) ; \
	       exit 1; } >&2
check-am: all-am
check: check-am
all-am: Makefile
installdirs:
install: install-am
install-exec: install-exec-am
install-data: install-data-am
uninstall: uninstall-am

install-am: all-am
	@$(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am

installcheck: installcheck-am
install-strip:
	$(MAKE) $(AM_MAKEFLAGS) INSTALL_PROGRAM="$(INSTALL_STRIP_PROGRAM)" \
	  install_sh_PROGRAM="$(INSTALL_STRIP_PROGRAM)" INSTALL_STRIP_FLAG=-s \
	  `test -z '$(STRIP)' || \
	    echo "INSTALL_PROGRAM_ENV=STRIPPROG='$(STRIP)'"` install
mostlyclean-generic:

clean-generic:

distclean-generic:
	-test -z "$(CONFIG_CLEAN_FILES)" || rm -f $(CONFIG_CLEAN_FILES)

maintainer-clean-generic:
	@echo "This command is intended for maintainers to use"
	@echo "it deletes files that may require special tools to rebuild."
clean-am: clean-generic mostlyclean-am

distclean: distclean-am
	-rm -f $(am__CONFIG_DISTCLEAN_FILES)
	-rm -f Makefile
distclean-am: clean-am distclean-generic

dvi: dvi-am

dvi-am:

html: html-am

info: info-am

info-am:

install-data-am:

install-exec-am:

install-info: install-info-am

install-man:

installcheck-am:

maintainer-clean: maintainer-clean-am
	-rm -f $(am__CONFIG_DISTCLEAN_FILES)
	-rm -rf $(top_srcdir)/autom4te.cache
	-rm -f Makefile
maintainer-clean-am: distclean-am maintainer-clean-generic

mostlyclean: mostlyclean-am

mostlyclean-am: mostlyclean-generic

pdf: pdf-am

pdf-am:

ps: ps-am

ps-am:

uninstall-am: uninstall-info-am

.PHONY: all all-am am--refresh check check-am clean clean-generic dist \
	dist-all dist-bzip2 dist-gzip dist-shar dist-tarZ dist-zip \
	distcheck distclean distclean-generic distcleancheck distdir \
	distuninstallcheck dvi dvi-am html html-am info info-am \
	install install-am install-data install-data-am install-exec \
	install-exec-am install-info install-info-am install-man \
	install-strip installcheck installcheck-am installdirs \
	maintainer-clean maintainer-clean-generic mostlyclean \
	mostlyclean-generic pdf pdf-am ps ps-am uninstall uninstall-am \
	uninstall-info-am

#

### End User configurable options ###
include Makefile.no_mmap
#CFLAGS = ${DCFLAGS}
#LFLAGS = ${DLFLAGS}
default: $(EXECS)
all:  $(EXECS)

include Makefile.no_timing

libboltzmann.a: $(SERIAL_OBJS1) $(SERIAL_OBJS2) $(SERIAL_OBJS3) $(SERIAL_OBJS4)
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_boot.o
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_mmap_superstate.o
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_boot_check.o
	$(AR) $(ARFLAGS) libboltzmann.a flatten_super_state.o
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_rep_state_i.o
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_init.o
	$(AR) $(ARFLAGS) libboltzmann.a alloc0.o
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_set_filename_ptrs.o
	$(AR) $(ARFLAGS) libboltzmann.a read_params.o
	$(AR) $(ARFLAGS) libboltzmann.a open_output_files.o
	$(AR) $(ARFLAGS) libboltzmann.a vgrng_init.o
	$(AR) $(ARFLAGS) libboltzmann.a vgrng.o
	$(AR) $(ARFLAGS) libboltzmann.a echo_params.o
	$(AR) $(ARFLAGS) libboltzmann.a size_rxns_list.o
	$(AR) $(ARFLAGS) libboltzmann.a size_rxns_file.o
	$(AR) $(ARFLAGS) libboltzmann.a init_rxn_file_keywords.o
	$(AR) $(ARFLAGS) libboltzmann.a parse_rxn_file_keyword.o
	$(AR) $(ARFLAGS) libboltzmann.a count_molecules.o
	$(AR) $(ARFLAGS) libboltzmann.a count_ws.o
	$(AR) $(ARFLAGS) libboltzmann.a count_nws.o
	$(AR) $(ARFLAGS) libboltzmann.a is_a_coef.o
	$(AR) $(ARFLAGS) libboltzmann.a alloc2.o
	$(AR) $(ARFLAGS) libboltzmann.a parse_reactions_file.o
	$(AR) $(ARFLAGS) libboltzmann.a parse_side_line.o
	$(AR) $(ARFLAGS) libboltzmann.a upcase.o
	$(AR) $(ARFLAGS) libboltzmann.a find_colon.o
	$(AR) $(ARFLAGS) libboltzmann.a echo_reactions_file.o
	$(AR) $(ARFLAGS) libboltzmann.a sort_molecules.o
	$(AR) $(ARFLAGS) libboltzmann.a merge_molecules.o
	$(AR) $(ARFLAGS) libboltzmann.a unique_molecules.o
	$(AR) $(ARFLAGS) libboltzmann.a unique_molecules_core.o
	$(AR) $(ARFLAGS) libboltzmann.a sort_compartments.o
	$(AR) $(ARFLAGS) libboltzmann.a merge_compartments.o
	$(AR) $(ARFLAGS) libboltzmann.a unique_compartments.o
	$(AR) $(ARFLAGS) libboltzmann.a unique_compartments_core.o
	$(AR) $(ARFLAGS) libboltzmann.a translate_compartments.o
	$(AR) $(ARFLAGS) libboltzmann.a print_molecules_dictionary.o
	$(AR) $(ARFLAGS) libboltzmann.a alloc3.o
	$(AR) $(ARFLAGS) libboltzmann.a set_compartment_ptrs.o
	$(AR) $(ARFLAGS) libboltzmann.a read_initial_concentrations.o
	$(AR) $(ARFLAGS) libboltzmann.a compartment_lookup.o
	$(AR) $(ARFLAGS) libboltzmann.a molecules_lookup.o
	$(AR) $(ARFLAGS) libboltzmann.a compute_ke.o
	$(AR) $(ARFLAGS) libboltzmann.a print_rxn_likelihoods_header.o
	$(AR) $(ARFLAGS) libboltzmann.a print_free_energy_header.o
	$(AR) $(ARFLAGS) libboltzmann.a flatten_state.o
	$(AR) $(ARFLAGS) libboltzmann.a free_boot_state.o
	$(AR) $(ARFLAGS) libboltzmann.a free_boot_state2.o
	$(AR) $(ARFLAGS) libboltzmann.a sort_global_compartments.o
	$(AR) $(ARFLAGS) libboltzmann.a sort_global_molecules.o
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_run.o
	$(AR) $(ARFLAGS) libboltzmann.a update_rxn_log_likelihoods.o
	$(AR) $(ARFLAGS) libboltzmann.a choose_rxn.o
	$(AR) $(ARFLAGS) libboltzmann.a bndry_flux_update.o
	$(AR) $(ARFLAGS) libboltzmann.a candidate_rxn.o
	$(AR) $(ARFLAGS) libboltzmann.a rxn_likelihood.o
	$(AR) $(ARFLAGS) libboltzmann.a rxn_likelihood_postselection.o
	$(AR) $(ARFLAGS) libboltzmann.a rxn_log_likelihoods.o
	$(AR) $(ARFLAGS) libboltzmann.a rxn_likelihoods.o
	$(AR) $(ARFLAGS) libboltzmann.a binary_search_l_u_b.o
	$(AR) $(ARFLAGS) libboltzmann.a rxn_conc_update.o
	$(AR) $(ARFLAGS) libboltzmann.a compute_delta_g_forward_entropy_free_energy.o
	$(AR) $(ARFLAGS) libboltzmann.a print_concentrations.o
	$(AR) $(ARFLAGS) libboltzmann.a print_likelihoods.o
	$(AR) $(ARFLAGS) libboltzmann.a save_likelihoods.o
	$(AR) $(ARFLAGS) libboltzmann.a print_free_energy.o
	$(AR) $(ARFLAGS) libboltzmann.a print_boundary_flux.o
	$(AR) $(ARFLAGS) libboltzmann.a print_restart_file.o
	$(AR) $(ARFLAGS) libboltzmann.a print_reactions_view.o
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_global_to_local_concs.o   
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_global_to_local_fluxes.o  
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_local_to_global_concs.o   
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_local_to_global_fluxes.o  
	$(AR) $(ARFLAGS) libboltzmann.a size_file.o			    
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_load.o		    
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_global_molecule_count.o   
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_max_local_state_size.o    
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_length_state_i.o	    
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_number_of_reaction_files.o
	$(AR) $(ARFLAGS) libboltzmann.a boltzmann_size_superstate.o
	$(AR) $(ARFLAGS) libboltzmann.a rxn_map_init.o
	$(AR) $(ARFLAGS) libboltzmann.a alloc4.o
	$(AR) $(ARFLAGS) libboltzmann.a form_molecules_matrix.o
	$(AR) $(ARFLAGS) libboltzmann.a rxn_map_parse_start_stop_line.o
	$(AR) $(ARFLAGS) libboltzmann.a rxn_map_run.o

boltzmann_boot_test: boltzmann_boot_test.o libboltzmann.a
	$(CLINKER) $(LFLAGS) -o boltzmann_boot_test boltzmann_boot_test.o $(TIMING_LIB) $(LIBS)

boltzmann_boot_test.o: boltzmann_boot_test.c boltzmann_boot.h boltzmann_boot_check.h $(SERIAL_INCS)
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_boot_test.c

boltzmann_boot.o: boltzmann_boot.c boltzmann_boot.h alloc0.h read_params.h open_output_files.h vgrng_init.h echo_params.h size_rxns_list.h size_rxns_file.h alloc2.h parse_reactions_file.h echo_reactions_file.h sort_compartments.h unique_compartments.h unique_compartments_core.h translate_compartments.h sort_molecules.h unique_molecules.h unique_molecules_core.h print_molecules_dictionary.h alloc3.h set_compartment_ptrs.h read_initial_concentrations.h compute_ke.h print_rxn_likelihoods_header.h print_free_energy_header.h flatten_state.h free_boot_state2.h sort_global_compartments.h sort_global_molecules.h count_ws.h count_nws.h boltzmann_mmap_superstate.h flatten_super_state.h $(SERIAL_INCS) 
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_boot.c

boltzmann_mmap_superstate.o: boltzmann_mmap_superstate.c boltzmann_mmap_superstate.h $(SERIAL_INCS) 
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_mmap_superstate.c

boltzmann_boot_check.o: boltzmann_boot_check.c boltzmann_boot_check.h flatten_super_state.h boltzmann_rep_state_i.h echo_reactions_file.h $(SERIAL_INCS)
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_boot_check.c

boltzmann_rep_state_i.o: boltzmann_rep_state_i.c boltzmann_rep_state_i.h flatten_state.h $(SERIAL_INCS)
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_rep_state_i.c

rxn_map: $(MMAP_OBJS) $(TIMING_LIB) rxn_map.o libboltzmann.a
	$(CLINKER) $(LFLAGS) -o rxn_map rxn_map.o $(SERIAL_OBJS1) $(SERIAL_OBJS3) $(MMAP_OBJS) $(TIMING_LIB) $(LIBS)

rxn_map.o: rxn_map.c rxn_map_init.h rxn_map_parse_start_stop_line.h rxn_map_run.h $(SERIAL_INCS)
	$(CC) $(DCFLAGS) $(TFLAGS) -c rxn_map.c

rxn_map_init.o: rxn_map_init.c rxn_map_init.h $(SERIAL_INCS) alloc0.h read_params.h echo_params.h size_rxns_file.h alloc2.h parse_reactions_file.h echo_reactions_file.h sort_compartments.h unique_compartments.h translate_compartments.h sort_molecules.h unique_molecules.h print_molecules_dictionary.h alloc3.h set_compartment_ptrs.h read_initial_concentrations.h vgrng_init.h vgrng.h compute_ke.h print_rxn_likelihoods_header.h print_free_energy_header.h alloc4.h form_molecules_matrix.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c rxn_map_init.c

rxn_map_parse_start_stop_line.o: rxn_map_parse_start_stop_line.c rxn_map_parse_start_stop_line.h count_ws.h count_nws.h find_colon.h compartment_lookup.h molecules_lookup.h $(SERIAL_INCS)
	$(CC) $(DCFLAGS) $(TFLAGS) -c rxn_map_parse_start_stop_line.c

rxn_map_run.o: rxn_map_run.c rxn_map_run.h $(SERIAL_INCS)
	$(CC) $(DCFLAGS) $(TFLAGS) -c rxn_map_run.c

alloc4.o: alloc4.c alloc4.h $(SERIAL_INCS)
	$(CC) $(DCFLAGS) $(TFLAGS) -c alloc4.c

boltzmann: $(MMAP_OBJS) $(TIMING_LIB) boltzmann.o libboltzmann.a
	$(CLINKER) $(LFLAGS) -o boltzmann boltzmann.o $(SERIAL_OBJS1) $(SERIAL_OBJS2) $(MMAP_OBJS) $(TIMING_LIB) $(LIBS)

boltzmann.o: $(SERIAL_INCS) boltzmann.c boltzmann_init.h boltzmann_run.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann.c

boltzmann_init.o: $(SERIAL_INCS) boltzmann_init.c boltzmann_init.h alloc0.h read_params.h open_output_files.h vgrng_init.h vgrng.h echo_params.h size_rxns_file.h alloc2.h parse_reactions_file.h echo_reactions_file.h sort_compartments.h unique_compartments.h translate_compartments.h sort_molecules.h unique_molecules.h print_molecules_dictionary.h alloc3.h set_compartment_ptrs.h read_initial_concentrations.h vgrng_init.h vgrng.h compute_ke.h print_rxn_likelihoods_header.h print_free_energy_header.h flatten_state.h free_boot_state.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_init.c

alloc0.o: $(SERIAL_INCS) alloc0.c alloc0.h boltzmann_set_filename_ptrs.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c alloc0.c

boltzmann_set_filenmae_ptrs.h: $(SERIAL_INCS) boltzmann_set_filenmae_ptrs.c boltzmann_set_filenmae_ptrs.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_set_filenmae_ptrs.c

read_params.o: $(SERIAL_INCS) read_params.c read_params.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c read_params.c

open_output_files.o: $(SERIAL_INCS) open_output_files.c open_output_files.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c open_output_files.c

vgrng_init.o: $(SERIAL_INCS) vgrng_init.c vgrng_init.h vgrng.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c vgrng_init.c

vgrng.o: $(SERIAL_INCS) vgrng.c vgrng.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c vgrng.c

echo_params.o: $(SERIAL_INCS) echo_params.c echo_params.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c echo_params.c

size_rxns_list.o: $(SERIAL_INCS) size_rxns_list.c size_rxns_list.h 
	$(CC) $(DCFLAGS) $(TFLAGS) -c size_rxns_list.c

size_rxns_file.o: $(SERIAL_INCS) size_rxns_file.c size_rxns_file.h init_rxn_file_keywords.h parse_rxn_file_keyword.h count_molecules.h count_ws.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c size_rxns_file.c

init_rxn_file_keywords.o: $(SERIAL_INCS) init_rxn_file_keywords.c init_rxn_file_keywords.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c init_rxn_file_keywords.c

parse_rxn_file_keyword.o: $(SERIAL_INCS) parse_rxn_file_keyword.c parse_rxn_file_keyword.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c parse_rxn_file_keyword.c

count_molecules.o: $(SERIAL_INCS) count_molecules.c count_molecules.h count_ws.h count_nws.h is_a_coef.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c count_molecules.c

count_ws.o: $(SERIAL_INCS) count_ws.c count_ws.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c count_ws.c

count_nws.o: $(SERIAL_INCS) count_nws.c count_nws.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c count_nws.c

alloc2.o: $(SERIAL_INCS) alloc2.c alloc2.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c alloc2.c

parse_reactions_file.o: $(SERIAL_INCS) parse_reactions_file.h parse_reactions_file.c parse_rxn_file_keyword.h count_ws.h count_nws.h upcase.h is_a_coef.h parse_side_line.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c parse_reactions_file.c

parse_side_line.o: $(SERIAL_INCS) parse_side_line.h parse_side_line.c count_ws.h count_nws.h upcase.h is_a_coef.h 
	$(CC) $(DCFLAGS) $(TFLAGS) -c parse_side_line.c

upcase.o: upcase.c upcase.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c upcase.c

find_colon.o: find_colon.c find_colon.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c find_colon.c

echo_reactions_file.o: $(SERIAL_INCS) echo_reactions_file.h echo_reactions_file.c 
	$(CC) $(DCFLAGS) $(TFLAGS) -c echo_reactions_file.c

sort_molecules.o: $(SERIAL_INCS) sort_molecules.c sort_molecules.h merge_molecules.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c sort_molecules.c

sort_global_molecules.o: $(SERIAL_INCS) sort_global_molecules.c sort_global_molecules.h merge_molecules.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c sort_global_molecules.c

merge_molecules.o: $(SERIAL_INCS) merge_molecules.c merge_molecules.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c merge_molecules.c

unique_molecules.o: $(SERIAL_INCS) unique_molecules.c unique_molecules.h unique_molecules_core.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c unique_molecules.c

unique_molecules_core.o: $(SERIAL_INCS) unique_molecules_core.c unique_molecules_core.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c unique_molecules_core.c

sort_compartments.o: $(SERIAL_INCS) sort_compartments.c sort_compartments.h merge_compartments.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c sort_compartments.c

sort_global_compartments.o: $(SERIAL_INCS) sort_global_compartments.c sort_global_compartments.h merge_compartments.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c sort_global_compartments.c

merge_compartments.o: $(SERIAL_INCS) merge_compartments.c merge_compartments.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c merge_compartments.c

unique_compartments.o: $(SERIAL_INCS) unique_compartments.c unique_compartments.h unique_compartments_core.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c unique_compartments.c

unique_compartments_core.o: $(SERIAL_INCS) unique_compartments_core.c unique_compartments_core.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c unique_compartments_core.c

translate_compartments.o: $(SERIAL_INCS) translate_compartments.c translate_compartments.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c translate_compartments.c

print_molecules_dictionary.o: $(SERIAL_INCS) print_molecules_dictionary.c print_molecules_dictionary.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c print_molecules_dictionary.c

alloc3.o: $(SERIAL_INCS) alloc3.c alloc3.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c alloc3.c

set_compartment_ptrs.o: $(SERIAL_INCS) set_compartment_ptrs.c set_compartment_ptrs.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c set_compartment_ptrs.c

read_intial_concentrations.o: $(SERIAL_INCS) read_intial_concentrations.c read_intial_concentrations.h compartment_lookup.h molecules_lookup.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c read_initial_concentrations.c

molecules_lookup.o: $(SERIAL_INCS) molecules_lookup.c molecules_lookup.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c molecules_lookup.c

compartment_lookup.o: $(SERIAL_INCS) compartment_lookup.c compartment_lookup.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c compartment_lookup.c

form_molecules_matrix.o: $(SERIAL_INCS) form_molecules_matrix.c form_molecules_matrix.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c form_molecules_matrix.c

compute_ke.o: $(SERIAL_INCS) compute_ke.c compute_ke.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c compute_ke.c

print_rxn_likelihoods_header.o: $(SERIAL_INCS) print_rxn_likelihoods_header.c print_rxn_likelihoods_header.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c print_rxn_likelihoods_header.c

print_free_energy_header.o: $(SERIAL_INCS) print_free_energy_header.c print_free_energy_header.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c print_free_energy_header.c

flatten_state.o: $(SERIAL_INCS) flatten_state.c flatten_state.h boltzmann_set_filename_ptrs.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c flatten_state.c

flatten_super_state.o: $(SERIAL_INCS) flatten_super_state.c flatten_super_state.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c flatten_super_state.c

free_boot_state.o: $(SERIAL_INCS) free_boot_state.c free_boot_state.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c free_boot_state.c

free_boot_state2.o: $(SERIAL_INCS) free_boot_state2.c free_boot_state2.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c free_boot_state2.c

boltzmann_run.o: $(SERIAL_INCS) boltzmann_run.c boltzmann_run.h update_rxn_log_likelihoods.h choose_rxn.h compute_delta_g_forward_entropy_free_energy.h print_concentrations.h print_likelihoods.h save_likelihoods.h print_free_energy.h print_boundary_flux.h print_restart_file.h print_reactions_view.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_run.c

update_rxn_log_likelihoods.o: $(SERIAL_INCS) update_rxn_log_likelihoods.c update_rxn_log_likelihoods.h rxn_log_likelihoods.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c update_rxn_log_likelihoods.c

choose_rxn.o: ${SERIAL_INCS} choose_rxn.c choose_rxn.h candidate_rxn.h rxn_likelihood_postselection.h bndry_flux_update.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c choose_rxn.c

candidate_rxn.o: $(SERIAL_INCS) candidate_rxn.c candidate_rxn.h vgrng.h binary_search_l_u_b.h rxn_conc_update.h rxn_conc_update.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c candidate_rxn.c

rxn_likelihood.o: $(SERIAL_INCS) rxn_likelihood.c rxn_likelihood.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c rxn_likelihood.c

rxn_log_likelihoods.o: $(SERIAL_INCS) rxn_log_likelihoods.c rxn_log_likelihoods.h rxn_likelihoods.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c rxn_log_likelihoods.c

rxn_likelihoods.o: $(SERIAL_INCS) rxn_likelihoods.c rxn_likelihoods.h rxn_likelihood.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c rxn_likelihoods.c

rxn_likelihood_postselection.o: $(SERIAL_INCS) rxn_likelihood_postselection.c rxn_likelihood_postselection.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c rxn_likelihood_postselection.c

binary_search_l_u_b.o: $(SERIAL_INCS) binary_search_l_u_b.c binary_search_l_u_b.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c binary_search_l_u_b.c

rxn_conc_update.o: $(SERIAL_INCS) rxn_conc_update.c rxn_conc_update.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c rxn_conc_update.c

bndry_flux_update.o: $(SERIAL_INCS) bndry_flux_update.c bndry_flux_update.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c bndry_flux_update.c

compute_delta_g_forward_entropy_free_energy.o: $(SERIAL_INCS) compute_delta_g_forward_entropy_free_energy.c compute_delta_g_forward_entropy_free_energy.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c compute_delta_g_forward_entropy_free_energy.c

print_concentrations.o: $(SERIAL_INCS) print_concentrations.c print_concentrations.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c print_concentrations.c

print_likelihoods.o: $(SERIAL_INCS) print_likelihoods.c print_likelihoods.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c print_likelihoods.c

save_likelihoods.o: $(SERIAL_INCS) save_likelihoods.c save_likelihoods.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c save_likelihoods.c

print_free_energy.o: $(SERIAL_INCS) print_free_energy.c print_free_energy.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c print_free_energy.c

print_boundary_flux.o: $(SERIAL_INCS) print_boundary_flux.c print_boundary_flux.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c print_boundary_flux.c

print_restart_file.o: $(SERIAL_INCS) print_restart_file.c print_restart_file.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c print_restart_file.c

print_reactions_view.o: $(SERIAL_INCS) print_reactions_view.c print_reactions_view.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c print_reactions_view.c

boltzmann_global_to_local_concs.o: boltzmann_global_to_local_concs.c boltzmann_global_to_local_concs.h flatten_super_state.h flatten_state.h $(SERIAL_INCS) 
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_global_to_local_concs.c

boltzmann_global_to_local_fluxes.o: boltzmann_global_to_local_fluxes.c boltzmann_global_to_local_fluxes.h flatten_super_state.h flatten_state.h $(SERIAL_INCS) 
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_global_to_local_fluxes.c

boltzmann_local_to_global_concs.o: boltzmann_local_to_global_concs.c boltzmann_local_to_global_concs.h flatten_super_state.h flatten_state.h $(SERIAL_INCS) 
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_local_to_global_concs.c

boltzmann_local_to_global_fluxes.o: boltzmann_local_to_global_fluxes.c boltzmann_local_to_global_fluxes.h flatten_super_state.h flatten_state.h $(SERIAL_INCS) 
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_local_to_global_fluxes.c

size_file.o: size_file.c size_file.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c size_file.c

boltzmann_load.o: boltzmann_load.c boltzmann_load.h size_file.h boltzmann_mmap_superstate.h
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_load.c

boltzmann_global_molecule_count.o: boltzmann_global_molecule_count.c boltzmann_global_molecule_count.h $(SERIAL_INCS) 
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_global_molecule_count.c

boltzmann_max_local_state_size.o: boltzmann_max_local_state_size.c boltzmann_max_local_state_size.h $(SERIAL_INCS) 
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_max_local_state_size.c

boltzmann_length_state_i.o: boltzmann_length_state_i.c boltzmann_length_state_i.h $(SERIAL_INCS) 
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_length_state_i.c

boltzmann_number_of_reaction_files.o: boltzmann_number_of_reaction_files.c boltzmann_number_of_reaction_files.h $(SERIAL_INCS)
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_number_of_reaction_files.c

boltzmann_size_superstate.o: boltzmann_size_superstate.c boltzmann_size_superstate.h $(SERIAL_INCS)
	$(CC) $(DCFLAGS) $(TFLAGS) -c boltzmann_size_superstate.c

clean:
	-/bin/rm -f *.o *.a *~ $(EXECS)
.c.o:
	$(CC) $(CFLAGS) $(TFLAGS) -c $<
.f.o:
	$(F77) $(FFLAGS) $(TFLAGS) -c $<
.f90.o:
	$(F90) $(FFLAGS) $(TFLAGS) -c $<
SUFFIXES: .f90
# Tell versions [3.59,3.63) of GNU make to not export all variables.
# Otherwise a system limit (for SysV at least) may be exceeded.
.NOEXPORT:
