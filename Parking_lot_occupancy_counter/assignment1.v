//FSM for car parking

module assignment1(enter,exit,disp_cntr,ab,clk,rset);
parameter
    A = 3'd1,
	B = 3'd2,
	C = 3'd3,
	D = 3'd4,
	P = 3'd5,
	Q = 3'd6,
	R = 3'd7;

output reg enter = 1'b0;
output reg exit = 1'b0;
output reg [3:0]disp_cntr = 4'd0;

input [1:0]ab;
input clk,rset;

reg inc = 1'd0;
reg dec = 1'd0;
reg [2:0]cur_state = 'd0;
reg [2:0]nxt_state = 'd0;
reg [3:0]cntr = 'd0;
///////////////////////////////////////////////////////////////////////
always @ (posedge clk)
begin
	if(rset) begin cur_state = A; end
    	else begin cur_state = nxt_state; end
end
/////////////////////////////////////////////////////////////////////
always @(cur_state,ab)
begin
            case(cur_state)
                A:	begin
                    //$display("A");
                    //$display("ab=%b",ab);
                    nxt_state[2] <= (~ab[1])&(ab[0]);
                    nxt_state[1] <= (ab[1])&(~ab[0]);
                    nxt_state[0] <= (~ab[1])|(ab[0]);
                    inc <= 1'b0;
                    dec <= 1'b0;
                    //$display("inc=%b ,dec=%b, cntr=%b, nxt_state=%b",inc,dec,cntr,nxt_state);
                    end
        
                B:	begin
                    //$display("B");
                    //$display("ab=%b",ab);
                    nxt_state[2] <= 1'b0;
                    nxt_state[1] <= 1'b1;
                    nxt_state[0] <= (ab[1])&(ab[0]);
                    inc <= 1'b0;
                    dec <= 1'b0;
                    //$display("inc=%b ,dec=%b, cntr=%b, nxt_state=%b",inc,dec,cntr,nxt_state);
                    end
        
                C:	begin
                    //$display("C");
                    //$display("ab=%b",ab);
                    nxt_state[2] <= (~ab[1])&(ab[0]);
                    nxt_state[1] <= (ab[1])|(~ab[0]);
                    nxt_state[0] <= (ab[1])|(~ab[0]);
                    inc <= 1'b0;
                    dec <= 1'b0;
                    //$display("inc=%b ,dec=%b, cntr=%b, nxt_state=%b",inc,dec,cntr,nxt_state);
                    end
        
                D:	begin
                    //$display("D");
                    //$display("ab=%b",ab);
                    nxt_state[2] <= (ab[1])|(ab[0]);
                    nxt_state[1] <= 1'b0;
                    nxt_state[0] <= (~ab[1])&(~ab[0]);
                    inc <= (~ab[1])&(~ab[0]);
                    dec <= 1'b0;
                    //$display("inc=%b ,dec=%b, cntr=%b, nxt_state=%b",inc,dec,cntr,nxt_state);
                    end
        
                P:	begin
                    //$display("P");
                    //$display("ab=%b",ab);
                    nxt_state[2] <= 1'b1;
                    nxt_state[1] <= (ab[1])&(ab[0]);
                    nxt_state[0] <= (~ab[1])|(~ab[0]);
                    inc <= 1'b0;
                    dec <= 1'b0;
                    //$display("inc=%b ,dec=%b, cntr=%b, nxt_state=%b",inc,dec,cntr,nxt_state);
                    end
        
                Q:	begin
                    //$display("Q");
                    //$display("ab=%b",ab);
                    nxt_state[2] <= 1'b1;
                    nxt_state[1] <= 1'b1;
                    nxt_state[0] <= (ab[1])&(~ab[0]);
                    inc <= 1'b0;
                    dec <= 1'b0;
                    //$display("inc=%b ,dec=%b, cntr=%b, nxt_state=%b",inc,dec,cntr,nxt_state);
                    end
        
                R:	begin
                    //$display("R");
                    //$display("ab=%b",ab);
                    nxt_state[2] <= (ab[1])|(ab[0]);
                    nxt_state[1] <= (ab[1])|(ab[0]);
                    nxt_state[0] <= 1'b1;
                    inc <= 1'b0;
                    dec <= (~ab[1])&(~ab[0]);
                    //$display("inc=%b ,dec=%b, cntr=%b, nxt_state=%b",inc,dec,cntr,nxt_state);
                    end
        
              default:	begin
                    //$display("default");
                    nxt_state = A;
                            end
                endcase
end

always@(posedge clk)
begin
	if(rset) begin cntr<='d0; end
	else if(inc) begin if (cntr<4'd8) begin cntr<=cntr + 1; enter<=1'b1; exit<=1'b0;  end end
	else if(dec) begin if (cntr>4'd0) begin cntr<=cntr - 1; enter<=1'b0; exit<=1'b1;   end end
	else
	begin enter<= 1'b0; exit<=1'b0; 
	end
	disp_cntr <= cntr;
	if(rset)
    begin
            delay_count<=27'd0;
            div_clk <= 1'b0;
    end
    else 
    begin        
                if(delay_count==27'd67108864)
                begin
                      delay_count<=27'd0;
                      div_clk <= ~div_clk;  
                end
                else
                begin
                    delay_count<=delay_count+1;
                end
    end
           
	      if(cntr>=4'd8)
	      begin
	      disp_cntr[3] <= div_clk;
	      disp_cntr[2] <= div_clk;
	      disp_cntr[1] <= div_clk;
	      disp_cntr[0] <= div_clk;
	      end
	                    
end

endmodule