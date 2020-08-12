`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2018 23:04:30
// Design Name: 
// Module Name: top_fpdpdivision
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

module top_fpdpdivision(clk);
    
input clk;

wire [63:0] fpdp_quotient;
wire [3:0] done;

wire [63:0] fpdp_dividend;
wire [63:0] fpdp_divisor;
wire [3:0] ready;
wire rset;

fpdp_division inst (
    .fpdp_quotient(fpdp_quotient),
	.done(done),
	.fpdp_dividend(fpdp_dividend),
	.fpdp_divisor(fpdp_divisor),
	.ready(ready),
	.clk(clk),
	.rset(rset)
	);

vio_0 fpdpdivision_vio (
  .clk(clk),                // input wire clk
  .probe_in0(fpdp_dividend),    // input wire [63 : 0] probe_in0
  .probe_in1(done),    // input wire [3 : 0] probe_in1
  .probe_out0(fpdp_dividend),  // output wire [63 : 0] probe_out0
  .probe_out1(fpdp_divisor),  // output wire [63 : 0] probe_out1
  .probe_out2(ready),  // output wire [3 : 0] probe_out2
  .probe_out3(rset)  // output wire [0 : 0] probe_out3
  );

endmodule
