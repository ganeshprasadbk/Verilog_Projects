//IEEE 754 double precision floating point division Test Bench
//https://babbage.cs.qc.cuny.edu/IEEE-754/  <----for verifying calculation


module fpdp_division_TB;

wire [63:0]fpdp_quotient;
wire [3:0]done;

reg [63:0]fpdp_dividend;
reg [63:0]fpdp_divisor;
reg [3:0]ready;
reg clk='d0;
reg rset='d1;

fpdp_division dut (
	.fpdp_quotient(fpdp_quotient),
	.done(done),
	.fpdp_dividend(fpdp_dividend),
	.fpdp_divisor(fpdp_divisor),
	.ready(ready),
	.clk(clk),
	.rset(rset)
	);
		
always
 #5 clk=~clk;

initial
begin
#1 fpdp_dividend = 'h3FF0000000000000; fpdp_divisor = 'h40D8E07288CE703B; ready = 'd1;
#6 rset = 'd0;
end
endmodule
