//This verilog code defines behavioral model for BCD to 7 segment display

module bcd_to_7segment_disp(output [6:0]out, input [3:0]in);

reg [6:0]y = 7'b1111110; 
assign out = y;

always@(in) 
begin
	case(in)
	4'd0:	y <= 7'b1111110;// 7Eh = 126d
	4'd1:	y <= 7'b0110000;// 30h = 48d
	4'd2:	y <= 7'b1101101;// 6Dh = 109d
	4'd3:	y <= 7'b1111001;// 79h = 121d
	4'd4:	y <= 7'b0110011;// 33h = 51d
	4'd5:	y <= 7'b1011011;// 5Bh = 91d
	4'd6:	y <= 7'b1011111;// 5Fh = 95d
	4'd7:	y <= 7'b1110000;// 70h = 112d
	4'd8:	y <= 7'b1111111;// 7Fh = 127d
	4'd9:	y <= 7'b1111011;// 7Bh = 123d
	default:y <= 7'b1111110;// 00h = 0d
	endcase
end
endmodule 