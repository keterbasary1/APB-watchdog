`ifndef RKV_WATCHDOG_INTEGRATION_TEST_SV
`define RKV_WATCHDOG_INTEGRATION_TEST_SV

class rkv_watchdog_integration_test extends rkv_watchdog_base_test;

    `uvm_component_utils(rkv_watchdog_integration_test)
    rkv_watchdog_integration_virt_seq seq

    function new(string name = "rkv_watchdog_integration_test", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        seq = rkv_watchdog_integration_virt_seq::type_id::create("seq", this);
    endfunction : build_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction : connect_phase

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        //TODO attach virtual sequence on the virtual sequencer
        seq.start(env.virt_sqr);
        phase.drop_objection(this);
    endtask : run_phase

endclass

`endif // RKV_WATCHDOG_INTEGRATION_TEST_SV

