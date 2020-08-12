//IEEE 754 double precision floating point kth power calculation 
//https://babbage.cs.qc.cuny.edu/IEEE-754/ --for verification of computation of this code
//http://www.rfwireless-world.com/Tutorials/floating-point-tutorial.html --for algorithm

module fpdp_power_TB;

wire [63:0]fpdp_power_output;
wire [3:0]done;

reg [63:0]fpdp_power_input;
reg [6:0]power;
reg [3:0]ready='d0;
reg clk='d0;
reg rset='d1;

fpdp_power dut (
	.fpdp_power_output(fpdp_power_output),
	.done(done),
	.fpdp_power_input(fpdp_power_input),
	.power(power),
	.ready(ready),
	.clk(clk),
	.rset(rset)
	);

always
#5 clk = ~ clk;

initial
begin
#1 fpdp_power_input <= 'h47A7445B78D792C6; power = 'd7; ready = 'd1;
#50 rset = 'd0;
end
endmodule
