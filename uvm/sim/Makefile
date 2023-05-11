#############################
# User variables
#############################
TB      	= rkv_watchdog_tb
SEED    	= 1
GUI	  		?= 0
TESTNAME 	?= rkv_apb_watchdog_default_test
CTEST 		?= 0
DFILES  	= ../../verilog/{cmsdk_apb_watchdog_frc.v,cmsdk_apb_watchdog.v}
VFILES  	+= ../tb/rkv_watchdog_tb.sv 


#############################
# Environment variables
#############################
VCOMP                = vlogan -full64 -ntb_opts uvm-1.2 -sverilog -timescale=1ps/1ps -nc -l comp.log +incdir+../../verilog
ELAB                 = vcs -full64 -ntb_opts uvm-1.2 -debug_acc+all -l elab.log -sim_res=1ps -cm line+tgl+branch -cm_hier cm.cfg
RUN                  = $(TB).simv -l run.log -sml -cm line+tgl+branch -cm_name $(TB)_$(SEED) +ntb_random_seed=$(SEED) +UVM_TESTNAME=$(TESTNAME)
ifeq ($(GUI),1)
RUN += -gui
endif

comp:
	$(VCOMP) 
	$(VCOMP) $(DFILES) $(VFILES)

elab: comp
	$(ELAB) -top $(TB) -o $(TB).simv

run:
	$(RUN) 

rung:
	$(RUN) -gui

editcov:
	urg -full64 -format both -dir $(TB).simv.vdb 
	dve -cov -dir $(TB).simv.vdb

# option for exlucde file given to generate coverage report 
# if there is such a coverage exclusion file
# urg -dir ... -elfile filename.el
viewcov:
	urg -full64 -format both -dir $(TB).simv.vdb 
	firefox urgReport/dashboard.html

clean:
	rm -rf AN.DB DVEfiles csrc *.simv *.simv.daidir *.simv.vdb ucli.key
	rm -rf *.log* *.vpd *.h urgReport

