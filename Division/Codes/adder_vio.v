`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2016 03:01:05 PM
// Design Name: 
// Module Name: adder_vio
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


module adder_vio(
    input clock
    );
    
    wire [7:0] A;
    wire [7:0] B;
    wire CE;
    wire [8:0] S;
    wire clock;
    
c_addsub_0 your_instance_name0 (
      .A(A),      // input wire [7 : 0] A
      .B(B),      // input wire [7 : 0] B
      .CLK(clock),  // input wire CLK
      .CE(CE),    // input wire CE
      .S(S)      // output wire [8 : 0] S
    );
    
    
 vio_0 your_instance_name1 (
      .clk(clock),                // input wire clk
      .probe_in0(S),    // input wire [8 : 0] probe_in0
      .probe_out0(A),  // output wire [7 : 0] probe_out0
      .probe_out1(B),  // output wire [7 : 0] probe_out1
      .probe_out2(CE)  // output wire [0 : 0] probe_out2
    );
    
endmodule
