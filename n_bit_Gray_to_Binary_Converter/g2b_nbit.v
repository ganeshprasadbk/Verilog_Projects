module g2b_nbit#(parameter n = 5)(output [n-1:0]b, input [n-1:0]g );

assign b[n-1] = g[n-1];
genvar i;
	for(i=n-2; i>=0; i=i-1)
	begin: Gray_to_Binary
		assign b[i] = b[i+1] ^ g[i];
	end

endmodule 