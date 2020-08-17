`timescale 1ns/1ps
module b2g_nbit_TB#(parameter n=5);
wire[n-1:0]g;
reg [n-1:0]b = 'd0;

b2g_nbit dut (.g(g),.b(b));

initial
begin
	repeat(2**n)
	begin
	#5 b = b + 1 ;
	$monitor("%d, Gray_Code=%b, Binary_Code=%b",b,g,b);
	end
end


endmodule 