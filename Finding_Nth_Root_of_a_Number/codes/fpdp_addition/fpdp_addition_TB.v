//IEEE Floating Point Addition (Double Precision) Test Bench
//https://www.h-schmidt.net/FloatConverter/IEEE754.html --for verification of computation of this code
//http://www.rfwireless-world.com/Tutorials/floating-point-tutorial.html --for algorithm


module fpdp_addition_TB;

wire [63:0]output_z;
wire [3:0]done;

reg [63:0]input_a;
reg [63:0]input_b;
reg [3:0]ready='d0;
reg clk='d0;
reg rset='d1;

fpdp_addition uut (
	.output_z(output_z),
	.done(done),
	.input_a(input_a),
	.input_b(input_b),
	.ready(ready),
	.clk(clk),
	.rset(rset)
	);

always
#5 clk <= ~clk;

initial
begin
//#10 rset <= 1'b1;
input_a <= 'h3FF8BDE1E2DE8709; input_b <= 'h41163D064C49BA5E; 
#100 ready='d1; 
end
endmodule
