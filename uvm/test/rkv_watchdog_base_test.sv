`ifndef RKV_WATCHDOG_BASE_TEST_SV
`define RKV_WATCHDOG_BASE_TEST_SV

class rkv_watchdog_base_test extends uvm_test;
    rkv_watchdog_env env;
    `uvm_component_utils(rkv_watchdog_base_test)

    function new(string name = "rkv_watchdog_base_test", uvm_component parent);
        super.new(name, parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = rkv_watchdog_env::type_id::create("env", this);
    endfunction : build_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction : connect_phase

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        do_init_clk();
        do_init_regs();
        phase.drop_objection(this);
    endtask : run_phase

    virtual task do_init_clk();
        //TODO in sub_class
    endtask

    virtual task do_init_regs();
        //TODO in sub_class
    endtask

endclass : rkv_watchdog_base_test

`endif // RKV_WATCHDOG_BASE_TEST_SV
