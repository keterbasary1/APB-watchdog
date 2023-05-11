`ifndef RKV_WATCHDOG_VIRTUAL_SEQUENCER_SV
`define RKV_WATCHDOG_VIRTUAL_SEQUENCER_SV

class rkv_watchdog_virtual_sequencer extends uvm_sequencer;

  `uvm_component_utils(rkv_watchdog_virtual_sequencer)

  function new(string name = "rkv_watchdog_virtual_sequencer", uvm_component parent);
    super.new(name, parent);
  endfunction : new

endclass

`endif macro