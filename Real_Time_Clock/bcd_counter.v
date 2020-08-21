/*This verilog code defines a counter which can work as a
1. mod-2 counter
2. mod-3 counter
3. mod-4 counter
4. mod-6 counter
5. mod-10 counter
depending upon the value of mode
*/

module bcd_counter(output [3:0]count, output ov, input [3:0]mode, input clk, rset);

reg [3:0]count_temp = 4'd0;
reg ov_temp = 0;

assign count = count_temp;
assign ov = ov_temp;

always@(posedge clk)
begin
	if(rset)
	begin 
		count_temp <= 4'd0;
		ov_temp <= 0;
	end
	else
	begin
		case(mode)
		4'd2:begin		//mod-2 counter
			if(count_temp < 'd1 )
			begin
				count_temp <= count_temp + 4'd1;
				ov_temp <= 0;
			end
			else
			begin
				count_temp <= 4'd0;
				ov_temp <= 1;
			end
		end
		4'd3:begin		//mod-3 counter
			if(count_temp < 'd2 )
			begin
				count_temp <= count_temp + 4'd1;
				ov_temp <= 0;
			end
			else
			begin
				count_temp <= 4'd0;
				ov_temp <= 1;
			end
		end
		4'd4:begin		//mod-4 counter
			if(count_temp < 'd3 )
			begin
				count_temp <= count_temp + 4'd1;
				ov_temp <= 0;
			end
			else
			begin
				count_temp <= 4'd0;
				ov_temp <= 1;
			end
		end
		4'd6:begin		//mod-6 counter
			if(count_temp < 'd5 )
			begin
				count_temp <= count_temp + 4'd1;
				ov_temp <= 0;
			end
			else
			begin
				count_temp <= 4'd0;
				ov_temp <= 1;
			end
		end
		4'd10:begin		//mod-10 counter
			if(count_temp < 'd9 )
			begin
				count_temp <= count_temp + 4'd1;
				ov_temp <= 0;
			end
			else
			begin
				count_temp <= 4'd0;
				ov_temp <= 1;
			end
		end
		default:begin
			count_temp <= 0;
			ov_temp <= 0;
			end
		endcase
	end
end
endmodule 
