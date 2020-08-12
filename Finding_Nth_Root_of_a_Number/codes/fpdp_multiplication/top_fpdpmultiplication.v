`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2018 22:25:20
// Design Name: 
// Module Name: top_fpdpmultiplication
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

module top_fpdpmultiplication(clk);

input clk;

wire [63:0]fpdp_product;
wire [3:0]done;
    
wire [63:0]fpdp_multiplier;
wire [63:0]fpdp_multiplicand;
wire [3:0]ready;
wire rset;
   
fpdp_multiplication inst (
    .fpdp_product(fpdp_product),
    .done(done),
    .fpdp_multiplier(fpdp_multiplier),
    .fpdp_multiplicand(fpdp_multiplicand),
    .ready(ready),
    .clk(clk),
    .rset(rset)
    );

vio_0 fpdpmultiplication_vio (
    .clk(clk),                // input wire clk
    .probe_in0(fpdp_product),    // input wire [63 : 0] probe_in0
    .probe_in1(done),    // input wire [3 : 0] probe_in1
    .probe_out0(fpdp_multiplier),  // output wire [63 : 0] probe_out0
    .probe_out1(fpdp_multiplicand),  // output wire [63 : 0] probe_out1
    .probe_out2(ready),  // output wire [3 : 0] probe_out2
    .probe_out3(rset)  // output wire [0 : 0] probe_out3
    );
    
endmodule
