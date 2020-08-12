`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2018 00:24:17
// Design Name: 
// Module Name: top_fpdpreciprocal
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

module top_fpdpreciprocal(clk);

input clk;

wire [63:0] rcprcl_output;
wire [3:0] done;


wire [63:0]rcprcl_input;
wire [3:0]ready;
wire rset;

fpdp_reciprocal inst (
    .rcprcl_output(rcprcl_output),
    .done(done),
	.rcprcl_input(rcprcl_input),
	.ready(ready),
	.clk(clk),
	.rset(rset)
	);
	
vio_0 fpdpreciprocal_vio (
    .clk(clk),                // input wire clk
    .probe_in0(rcprcl_output),    // input wire [63 : 0] probe_in0
    .probe_in1(done),    // input wire [3 : 0] probe_in1
    .probe_out0(rcprcl_input),  // output wire [63 : 0] probe_out0
    .probe_out1(ready),  // output wire [3 : 0] probe_out1
    .probe_out2(rset)  // output wire [0 : 0] probe_out2
    );		
    
endmodule
