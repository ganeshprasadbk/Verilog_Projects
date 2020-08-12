`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2018 21:01:24
// Design Name: 
// Module Name: top_realfpdp
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

module top_realfpdp(clk);

input clk;

wire [63:0]fpdp;
wire [3:0]done;

wire [31:0]intg;
wire [63:0]frac;
wire [31:0]dec_point_pos;
wire [3:0]ready;
wire rset;

realtofpdp inst (
    .fpdp(fpdp),
    .done(done),
    .intg(intg),
    .frac(frac),
    .dec_point_pos(dec_point_pos),
    .ready(ready),
    .clk(clk),
    .rset(rset)
    );
        
vio_0 your_instance_name (
      .clk(clk),                // input wire clk
      .probe_in0(fpdp),    // input wire [63 : 0] probe_in0
      .probe_in1(done),    // input wire [3 : 0] probe_in1
      .probe_out0(intg),  // output wire [31 : 0] probe_out0
      .probe_out1(frac),  // output wire [63 : 0] probe_out1
      .probe_out2(dec_point_pos),  // output wire [31 : 0] probe_out2
      .probe_out3(ready),  // output wire [3 : 0] probe_out3
      .probe_out4(rset)  // output wire [0 : 0] probe_out4
    );    
    

endmodule
