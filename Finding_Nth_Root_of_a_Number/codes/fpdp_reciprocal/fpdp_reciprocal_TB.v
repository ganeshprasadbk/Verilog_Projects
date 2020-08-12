//IEEE 754 double precision floating point reciprocal operation Test Bench
//https://babbage.cs.qc.cuny.edu/IEEE-754/  <----for verifying calculation

module fpdp_reciprocal_TB;

wire [63:0]rcprcl_output;
wire [3:0]done;

reg [63:0]rcprcl_input;
reg [3:0]ready;
reg clk='d0;
reg rset='d1;

fpdp_reciprocal dut (
	.rcprcl_output(rcprcl_output),
	.done(done),
	.rcprcl_input(rcprcl_input),
	.ready(ready),
	.clk(clk),
	.rset(rset)
	);
		
always
#5 clk=~clk;

initial
begin
#1 rcprcl_input = 'h40D8E07288CE703B; ready = 'd1;
#6 rset = 'd0;
end
endmodule
