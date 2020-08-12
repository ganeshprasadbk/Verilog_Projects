//IEEE 754 double precision floating point kth power calculation 
//https://www.h-schmidt.net/FloatConverter/IEEE754.html--for verification of computation of this code
//http://www.rfwireless-world.com/Tutorials/floating-point-tutorial.html--for algorithm

module fpdp_power (
	fpdp_power_output,
	done,
	fpdp_power_input,
	power,
	ready,
	clk,
	rset
	);

output reg [63:0]fpdp_power_output='d0;
output reg [3:0]done='d0;

input [63:0]fpdp_power_input;
input [6:0]power;
input [3:0]ready;
input clk;
input rset;

reg [105:0]mant_product='d0;
reg [51:0]fpdp_power_input_mant;
reg [6:0]i='d1;	//keep bit width of power & i same
reg [6:0]mant_over_flow='d0;
reg mant_init='d1;

always@(posedge clk)
begin
	if(ready=='d1)
	begin
		if(mant_init)
		begin
			fpdp_power_input_mant = fpdp_power_input[51:0];
			mant_init ='d0;
		end
		else if(power=='d0) fpdp_power_output <= 'h3FF0000000000000;
		else if(power =='d1) fpdp_power_output <= fpdp_power_input;
		else if(fpdp_power_input=='d0) fpdp_power_output <= 'd0;
		else
		begin
			/* if (rset)
			begin
				fpdp_power_output <= 'd0;
				mant_product<='d0;
				fpdp_power_input_mant <= fpdp_power_input[22:0];
				i='d1;
				mant_over_flow='d0;
				$display("fpdp_power_output=%d,mant_product=%d,fpdp_power_input_mant=%d,i=%d",fpdp_power_output,mant_product,fpdp_power_input_mant,i);
			end
			else  
			begin*/
				if(i<power)
				begin
					mant_product = {1'd1,fpdp_power_input_mant[51:0]}*{1'd1,fpdp_power_input[51:0]};
					fpdp_power_input_mant = (mant_product[105]==1)? mant_product[104:53] : mant_product[103:52]; 
					mant_over_flow = (mant_product[105]==1)? (mant_over_flow + 'd1) : mant_over_flow ;
					i = i + 'd1;
					$display("mant_product=%b,fpdp_power_input_mant=%b",mant_product,fpdp_power_input_mant);
					$display("i<power=%d,i=%d,power=%d",(i<power),i,power);
				end
				else
				begin
					i = power;
					fpdp_power_output[63] = (fpdp_power_input[63]&&power[0]==1)? 'd1:'d0 ;
					$display("fpdp_power_output[63]=%b",fpdp_power_output[63]);
					fpdp_power_output[62:52] = fpdp_power_input[62:52]*power-'d1023*(power-'d1) + mant_over_flow;
					$display("fpdp_power_output[62:52]=%d",fpdp_power_output[62:52]);
					fpdp_power_output[51:0] = fpdp_power_input_mant;
					$display("fpdp_power_output[51:0]=%d",fpdp_power_output[51:0]);
					$display("fpdp_power_output[105]=%d",mant_product[105]);
					$display("10453fpdp_power_output[51:0]=%b",mant_product[104:53]);
					$display("10352fpdp_power_output[51:0]=%b",mant_product[103:52]);
					done = 'd1;
				end
			//end
		end
	end
end	
endmodule
		