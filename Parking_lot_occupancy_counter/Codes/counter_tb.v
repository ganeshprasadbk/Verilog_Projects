`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:44:34 08/18/2015
// Design Name:   counter
// Module Name:   D:/Xilinx_FPGA/XF_ISem1516/Work/Atlys/RC/Lab1/counter/counter_tb.v
// Project Name:  counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_tb;

	// Inputs
	reg clock;
	reg count_e;
	reg reset;

	// Outputs
	wire [7:0] count;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.clock(clock), 
		.count_e(count_e), 
		.reset(reset), 
		.count(count)
	);

		initial begin
		// Initialize Inputs
		clock = 0;
		count_e = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#10;
      count_e = 1;
		reset = 0;
		#50;
		end
		// Add stimulus here
   parameter PERIOD = 10;

   always begin
      clock = 1'b0;
      #(PERIOD/2) clock = 1'b1;
      #(PERIOD/2);  
	end
      
endmodule


