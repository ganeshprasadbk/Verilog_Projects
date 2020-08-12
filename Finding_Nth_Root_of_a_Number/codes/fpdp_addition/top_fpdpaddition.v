`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2018 21:53:01
// Design Name: 
// Module Name: top_fpdpaddition
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

module top_fpdpaddition(clk);

input clk;

wire [63:0] output_z;
wire [3:0]done;

wire [63:0] input_a;
wire [63:0] input_b;
wire [3:0] ready;
wire rset;

fpdp_addition inst  (
    .output_z(output_z),
    .done(done),
    .input_a(input_a),
    .input_b(input_b),
    .ready(ready),
    .clk(clk),
    .rset(rset)
    );
    
vio_0 fpdpaddition_vio (
    .clk(clk),                // input wire clk
    .probe_in0(output_z),    // input wire [63 : 0] probe_in0
    .probe_in1(done),    // input wire [3 : 0] probe_in1
    .probe_out0(input_a),  // output wire [63 : 0] probe_out0
    .probe_out1(input_b),  // output wire [63 : 0] probe_out1
    .probe_out2(ready),  // output wire [3 : 0] probe_out2
    .probe_out3(rset)  // output wire [0 : 0] probe_out3
    );
    
endmodule
