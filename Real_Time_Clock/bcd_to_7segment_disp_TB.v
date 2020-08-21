//Test Bench for bcd_to_7segment_disp

`timescale 1ns/1ps
module bcd_to_7segment_disp_TB; 
wire [6:0]y;
reg [3:0]in='d0;

bcd_to_7segment_disp dut(.out(out),.in(in));

initial
begin
	repeat(16)
	begin
	in = in + 'b1 ;
	$monitor("BCD_Disp=%b, ABCD=%b",y,in);
	#5;
	end
end

endmodule 