`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2018 23:34:31
// Design Name: 
// Module Name: top_fpdppower
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top_fpdppower(clk);

input clk;

wire [63:0]fpdp_power_output;
wire [3:0]done;

wire [63:0]fpdp_power_input;
wire [6:0]power;
wire [3:0]ready;
wire rset;


fpdp_power inst (
    .fpdp_power_output(fpdp_power_output),
    .done(done),
    .fpdp_power_input(fpdp_power_input),
    .power(power),
    .ready(ready),
    .clk(clk),
    .rset(rset)
    );

vio_0 fpdppower_vio (
  .clk(clk),                // input wire clk
  .probe_in0(fpdp_power_output),    // input wire [63 : 0] probe_in0
  .probe_in1(done),    // input wire [3 : 0] probe_in1
  .probe_out0(fpdp_power_input),  // output wire [63 : 0] probe_out0
  .probe_out1(power),  // output wire [6 : 0] probe_out1
  .probe_out2(ready),  // output wire [3 : 0] probe_out2
  .probe_out3(rset)  // output wire [0 : 0] probe_out3
  );

endmodule
