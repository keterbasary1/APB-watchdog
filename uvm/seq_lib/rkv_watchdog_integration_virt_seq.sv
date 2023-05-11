`ifndef RKV_WATCHDOG_INTEGRATION_VIRT_SV
`define RKV_WATCHDOG_INTEGRATION_VIRT_SV

class rkv_watchdog_integration_virt_seq extends rkv_watchdog_base_virtual_sequence;

    `uvm_component_utils(rkv_watchdog_integration_virt_seq)

    function new(string name = "rkv_watchdog_integration_virt_seq");
        super.new(name);
    endfunction : new

    virtual task body();
        super.body();
        `uvm_info("body","Entered...",UVM_LOW)
        //TODO in sub-class
        #1us;
        `uvm_info("SEQSTART","virtual sequence body started",UVM_LOW)
        #1us;
        `uvm_info("body","Exited...",UVM_LOW)
    endtask
endclass : rkv_watchdog_integration_virt_seq

`endif 