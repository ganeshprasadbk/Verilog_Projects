//IEEE 754 double precision floating point multiplication
//https://babbage.cs.qc.cuny.edu/IEEE-754/<----for verifying calculation

module fpdp_multiplication(
	fpdp_product,
	done,
	fpdp_multiplier,
	fpdp_multiplicand,
	ready,
	clk,
	rset
	);

output reg [63:0]fpdp_product='d0;
output reg [3:0]done;

input [63:0]fpdp_multiplier;
input [63:0]fpdp_multiplicand;
input [3:0]ready;
input clk;
input rset;

reg [105:0]mant_product;

always@(posedge clk or negedge rset)
begin
	if(ready=='d1)
	begin
		mant_product = {1'd1,fpdp_multiplier[51:0]}*{1'd1,fpdp_multiplicand[51:0]};
		if (rset) begin /*fpdp_product <= 'd0;*/ end
		else 
		begin
			if((fpdp_multiplier && fpdp_multiplicand)==0) fpdp_product <= 'd0;
			else
			begin
				fpdp_product[63] = fpdp_multiplier[63] ^ fpdp_multiplicand[63];
				$display("fpdp_product[63]=%b",fpdp_product[63]);
				fpdp_product[62:52] = fpdp_multiplier[62:52]+fpdp_multiplicand[62:52]-'d1023 + (1'd1 & mant_product[105]);
				$display("fpdp_product[62:52]=%d",fpdp_product[62:52]);
				fpdp_product[51:0] = (mant_product[105]==1)? mant_product[104:53] : mant_product[103:52];
				$display("fpdp_product[51:0]=%d",fpdp_product[51:0]);
				$display("fpdp_product[105]=%d",mant_product[105]);
				$display("fpdp_product[104:53]=%d",mant_product[104:53]);
				$display("4523fp_product[103:52]=%d",mant_product[103:52]);
				done = 'd1;			
			end
		end
	end
end
endmodule
