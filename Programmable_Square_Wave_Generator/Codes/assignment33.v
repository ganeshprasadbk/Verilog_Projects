module assignment33(M,N,clk,rst,var_clk,ref_clk);
input [3:0]M;
input [3:0]N;
input clk;
input rst;
output reg var_clk;
output reg ref_clk='d0;

reg [3:0]tempM;
reg [3:0]tempN;
reg [4:0]counton='d0;
reg [4:0]countoff='d0;

reg state;
parameter ON='d1 ,OFF='d0 ;


always@(posedge clk or posedge rst)
begin
	if(rst) begin state<=ON; counton<='d0; countoff<='d0; tempM<=M; tempN<=N; end
	else	begin
			case(state)
					ON:	begin var_clk<=1'b1;
						if(tempM==0) var_clk<=0;
						else
						begin
									if((counton+1)<tempM) begin	counton<=counton+1;	state<=ON;	end
									else	begin	countoff<='d0;	state<=OFF;	end
							$display("state=%d,tempM=%d ,M=%d ,tempN=%d ,N=%d ,counton=%d ",state,tempM,M,tempN,N,counton);
							end
						end

					OFF:	begin var_clk<=1'b0;
						if(tempN==0) var_clk<=1;
						else
						begin
									if((countoff+1)<tempN)	begin	countoff<=countoff+1;	state<=OFF;	end
									else	begin	counton<='d0;	state<=ON;	end
							$display("state=%d ,tempM=%d ,M=%d ,tempN=%d ,N=%d ,countoff=%d ",state,tempM,M,tempN,N,countoff);
							end
						end
					default: begin state<=ON; counton<='d0; countoff<='d0; end
			endcase
	end
end

always@(posedge clk)
begin
ref_clk =~ ref_clk;
end

endmodule 