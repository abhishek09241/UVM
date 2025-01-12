`timescale 1ps/1ps
`include "UVM_Macros.svh"
import uvm_pkg::*;

`include "adder_sub.sv"
`include "adder_sub_interface.sv"


typedef adder_sub_sequence;
typedef adder_sub_driver;
typedef adder_sub_monitor;
typedef adder_sub_sequencer;
typedef adder_sub_agent;
typedef adder_sub_sequence_item ;
typedef adder_sub_subscriber;
typedef adder_sub_scoreboard;
typedef adder_sub_env;
typedef parent_test;


`include "adder_sub_sequence.sv"
`include "adder_sub_driver.sv"
`include "adder_sub_monitor.sv"
`include "adder_sub_sequencer.sv"
`include "adder_sub_agent.sv"
`include "adder_sub_sequence_item.sv"
`include "adder_sub_subscriber.sv"
`include "adder_sub_scoreboard.sv"
`include "adder_sub_env.sv"
`include "parent_test.sv"


module adder_top;

    parameter DATA_WIDTH = 4;

    bit clk, reset;

    
    
    adder_sub_interface #(.DATA_WIDTH(DATA_WIDTH)) adder_sub_vif();

    adder_sub #(.DATA_WIDTH(DATA_WIDTH)) 
        adder_sub_dut(
            .clk(adder_sub_vif.clk),
            .rst(adder_sub_vif.rst),
            .data_in_1(adder_sub_vif.data_in_1),
            .data_in_2(adder_sub_vif.data_in_2),
            .ctrl(adder_sub_vif.ctrl),
            .enable(adder_sub_vif.enable),
            .data_out(adder_sub_vif.data_out)
        );

    always #10ns clk = ~clk;

    assign adder_sub_vif.clk = clk;
    assign adder_sub_vif.rst = reset;

    initial begin
          reset = 1;
    #10ns reset = 0;
    #20ns reset = 1;    
    end



    initial begin
        `uvm_info("Smile Please From RUN TEST your UVM STARTS","This is Top Module",UVM_NONE);
        uvm_config_db#(virtual adder_sub_interface #(.DATA_WIDTH(DATA_WIDTH)))::set(null,"uvm_test_top.adder_sub_env_handle.adder_sub_agent_handle.adder_sub_monitor_handle","INTERFACE_KEY",adder_sub_vif);
        uvm_config_db#(virtual adder_sub_interface #(.DATA_WIDTH(DATA_WIDTH)))::set(null,"uvm_test_top.adder_sub_env_handle.adder_sub_agent_handle.adder_sub_driver_handle","INTERFACE_KEY",adder_sub_vif );
        run_test("parent_test");
    end
endmodule