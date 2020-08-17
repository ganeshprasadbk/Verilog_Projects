module johnson_counter#(parameter n=9)(
    clk,
    rset,
    Count_out
    );
    input clk;
    input rset;

    output [n-1:0] Count_out;

    reg [n-1:0] Count_temp;

    always @(posedge(clk) or rset)
    begin
        if(rset == 1'b1)
	begin  
		Count_temp <= 'd0;
	end 
        else if(clk == 1'b1)
	begin 
		Count_temp <= {~Count_temp[0],Count_temp[n-1:1]};  
	end 
    end
    assign Count_out = Count_temp;    
endmodule 