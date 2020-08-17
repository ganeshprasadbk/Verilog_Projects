module b2g_nbit#(parameter n = 5)(output [n-1:0]g, input [n-1:0]b);

assign g[n-1] = b[n-1];
genvar i;
	for(i=n-2; i>=0; i=i-1)
	begin: Binary_to_Gray
		assign g[i] = b[i+1] ^ b[i];
	end

endmodule 