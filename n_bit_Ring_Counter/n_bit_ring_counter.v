module n_bit_ring_counter#(parameter n = 4)(output [n-1:0]ring_out,input clk,rset);

reg[n-1:0]q;
  
always@(posedge clk or negedge rset)
begin
	if (~rset)
	begin
		q <= {q[0],q[n-1:1]};
	end
	else
	q <= 'd1;

end

assign ring_out = q;

endmodule 