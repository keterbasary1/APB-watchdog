
module rkv_watchdog_tb;

    import uvm_pkg::*
    `include "uvm_macros.svh"
    
    bit apb_clk;
    bit apb_rstn;
    bit wdg_clk;
    bit wdg_rstn;

    cmsdk_apb_watchdog dut(
        input  wire         .PCLK(apb_clk),                     // APB clock
        input  wire         .PRESETn(apb_rstn),                 // APB reset
        input  wire         .PENABLE(apb_if_inst.penable),      // APB enable
        input  wire         .PSEL(apb_if_inst.psel),            // APB periph select
        input  wire [11:2]  .PADDR(apb_if_inst.paddr[11:2]),    // APB address bus
        input  wire         .PWRITE(apb_if_inst.pwrite),        // APB write
        input  wire [31:0]  .PWDATA(apb_if_inst.pwdata),        // APB write data

        input  wire         .WDOGCLK(wdg_clk),                  // Watchdog clock
        input  wire         .WDOGCLKEN(1'b1),                   // Watchdog clock enable
        input  wire         .WDOGRESn(wdg_rstn),                // Watchdog clock reset

        input  wire  [3:0]  .ECOREVNUM(wdg_if_inst.ecorevnum),  // ECO revision number

        output wire [31:0]  .PRDATA(apb_if_inst.prdata),        // APB read data

        output wire         .WDOGINT(wdg_if_inst.wdogint),      // Watchdog interrupt
        output wire         .WDOGRES(wdg_if_inst.wdogres)       // Watchdog timeout reset
    );

    apb_if apb_if_inst(apb_clk,apb_rstn);
    rkv_watchdog_if wdg_if_inst();

    initial begin :clk_gen
        fork
            forever #5ns  apb_clk <= !apb_clk;//100MHz
            forever #25ns wdg_clk <= !wdg_clk;//20MHz 
        join
    
    end

    initial begin :rstn_gen
        #2ns;
        apb_rstn <= 1;
        #20ns;
        apb_rstn <= 0;
        #20ns;
        apb_rstn <= 1;
    end
    assign wdg_rstn = apb_rstn;

    initial begin :vif_assign
        uvm_config_db#(virtual apb_if)::set(uvm_root::get(), "uvm_test_top.env.apb_mst", "vif", apb_if_inst);
        uvm_config_db#(virtual rkv_watchdog_if)::set(uvm_root::get(), "uvm_test_top.env", "vif", wdg_if_inst);
        uvm_config_db#(virtual rkv_watchdog_if)::set(uvm_root::get(), "uvm_test_top.env.virt_sqr", "vif", wdg_if_inst);

        run_test("");
    end

endmodule
