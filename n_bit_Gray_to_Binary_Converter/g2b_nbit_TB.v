`timescale 1ns/1ps
module g2b_nbit_TB#(parameter n=5);
wire[n-1:0]b;
reg [n-1:0]g = 'd0;

g2b_nbit dut (.b(b),.g(g));

initial
begin
	repeat(2**n)
	begin
	#5 g = g + 1 ;
	$monitor("%d, Binary_Code=%b, Gray_Code=%b",b,b,g);
	end
end

endmodule 