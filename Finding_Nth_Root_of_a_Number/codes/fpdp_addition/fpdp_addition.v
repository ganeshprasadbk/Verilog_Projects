//IEEE Floating Point Addition (Double Precision)
//https://www.h-schmidt.net/FloatConverter/IEEE754.html--for verification of computation of this code
//http://www.rfwireless-world.com/Tutorials/floating-point-tutorial.html--for algorithm

module fpdp_addition (
	output_z,
	done,
	input_a,
        input_b,
        ready,        
	clk,
        rset
	);

		
		
output reg[63:0]output_z='d0;
output reg[3:0]done = 'd0;

input [63:0]input_a;
input [63:0]input_b;
input [3:0]ready;
input clk;
input rset;

parameter   get_a         = 4'd0,
            get_b         = 4'd1,
            unpack        = 4'd2,
            special_cases = 4'd3,
            align         = 4'd4,
            add_0         = 4'd5,
            add_1         = 4'd6,
            normalise_1   = 4'd7,
            normalise_2   = 4'd8,
            round         = 4'd9,
            pack          = 4'd10,
            put_z         = 4'd11;

reg       [63:0] s_output_z;
reg       [3:0] state='d0;
reg       [63:0] a, b, z;
reg       [55:0] a_m, b_m;
reg       [52:0] z_m;
reg       [12:0] a_e, b_e, z_e;
reg       a_s, b_s, z_s;
reg       guard, round_bit, sticky;
reg       [56:0] sum;


always @(posedge clk)
begin
	if(ready=='d1)
	begin
		case(state)
		get_a:begin
			a = input_a;
			state = get_b;
			$display("a=%h",a);
		end

		get_b:begin
			b = input_b;
			state = unpack;
			$display("b=%h",b);
		end

		unpack:begin
			a_m <= {a[51 : 0], 3'd0};
			b_m <= {b[51 : 0], 3'd0};
			a_e <= a[62 : 52] - 1023;
			b_e <= b[62 : 52] - 1023;
			a_s <= a[63];
			b_s <= b[63];
			state <= special_cases;
			$display("a_m=%h",a_m);
			$display("b_m=%h",b_m);
			$display("a_e=%h",a_e);
			
		end

		special_cases:begin
				//if a is NaN or b is NaN return NaN 
				if ((a_e == 1024 && a_m != 0) || (b_e == 1024 && b_m != 0))
				begin
					z[63] <= 1;
					z[62:52] <= 2047;
					z[51] <= 1;
					z[50:0] <= 0;
					state <= put_z;
					//if a is inf return inf
				end
				else if (a_e == 1024)
				begin
					z[63] <= a_s;
					z[62:52] <= 2047;
					z[51:0] <= 0;
				  //if a is inf and signs don't match return nan
					if ((b_e == 1024) && (a_s != b_s))
					begin
						z[63] <= 1;
						z[62:52] <= 2047;
						z[51] <= 1;
						z[50:0] <= 0;
					end
				  state <= put_z;
				//if b is inf return inf
				end
				else if (b_e == 1024)
				begin
					z[63] <= b_s;
					z[62:52] <= 2047;
					z[51:0] <= 0;
					state <= put_z;
				//if a is zero return b
				end
				else if ((($signed(a_e) == -1023) && (a_m == 0)) && (($signed(b_e) == -1023) && (b_m == 0)))
				begin
					z[63] <= a_s & b_s;
					z[62:52] <= b_e[10:0] + 1023;
					z[51:0] <= b_m[55:3];
					state <= put_z;
				//if a is zero return b
				end
				else if (($signed(a_e) == -1023) && (a_m == 0))
				begin
					z[63] <= b_s;
					z[62:52] <= b_e[10:0] + 1023;
					z[51:0] <= b_m[55:3];
					state <= put_z;
				//if b is zero return a
				end
				else if (($signed(b_e) == -1023) && (b_m == 0))
				begin
					z[63] <= a_s;
					z[62:52] <= a_e[10:0] + 1023;
					z[51:0] <= a_m[55:3];
					state <= put_z;
				end
				else
				begin
				  //Denormalised Number
					if ($signed(a_e) == -1023)
					begin
						a_e <= -1022;
					end
					else
					begin
						a_m[55] <= 1;
					end
					  //Denormalised Number
					if ($signed(b_e) == -1023)
					begin
						b_e <= -1022;
					end
					else
					begin
						b_m[55] <= 1;
					end
					  state <= align;
				end
			end

		align:begin
				if ($signed(a_e) > $signed(b_e))
				begin
					b_e <= b_e + 1;
					b_m <= b_m >> 1;
					b_m[0] <= b_m[0] | b_m[1];
				end
				else if ($signed(a_e) < $signed(b_e))
				begin
					a_e <= a_e + 1;
					a_m <= a_m >> 1;
					a_m[0] <= a_m[0] | a_m[1];
				end
				else
				begin
					state <= add_0;
				end
			end

		add_0:begin
			z_e <= a_e;
			if (a_s == b_s)
			begin
				sum <= {1'd0, a_m} + b_m;
				z_s <= a_s;
			end
			else
			begin
			if (a_m > b_m)
			begin
				sum <= {1'd0, a_m} - b_m;
				z_s <= a_s;
			end
			else
			begin
				sum <= {1'd0, b_m} - a_m;
				z_s <= b_s;
			end
			end
			state <= add_1;
		end

		add_1:begin
			if (sum[56])
			begin
				z_m <= sum[56:4];
				guard <= sum[3];
				round_bit <= sum[2];
				sticky <= sum[1] | sum[0];
				z_e <= z_e + 1;
			end
			else
			begin
				z_m <= sum[55:3];
				guard <= sum[2];
				round_bit <= sum[1];
				sticky <= sum[0];
			end
				state <= normalise_1;
		end

		normalise_1:begin
				if (z_m[52] == 0 && $signed(z_e) > -1022)
				begin
					z_e <= z_e - 1;
					z_m <= z_m << 1;
					z_m[0] <= guard;
					guard <= round_bit;
					round_bit <= 0;
				end
				else
				begin
					state <= normalise_2;
				end
			  end

		normalise_2:begin
				if ($signed(z_e) < -1022)
				begin
					z_e <= z_e + 1;
					z_m <= z_m >> 1;
					guard <= z_m[0];
					round_bit <= guard;
					sticky <= sticky | round_bit;
				end
				else
				begin
					state <= round;
				end
			end

		round:begin
				if (guard && (round_bit | sticky | z_m[0]))
				begin
					z_m <= z_m + 1;
					if (z_m == 53'h1fffffffffffff)
					begin
						z_e <=z_e + 1;
					end
				end
				state <= pack;
			end

		pack:begin
				z[51 : 0] <= z_m[51:0];
				z[62 : 52] <= z_e[10:0] + 1023;
				z[63] <= z_s;
				if ($signed(z_e) == -1022 && z_m[52] == 0)
				begin
					z[62 : 52] <= 0;
				end
				
				//if overflow occurs, return inf
				if ($signed(z_e) > 1023)
				begin
					z[51 : 0] <= 0;
					z[62 : 52] <= 2047;
					z[63] <= z_s;
				end
				state <= put_z;
		end

		put_z:begin
			//s_output_z = z;
			output_z = z;
			$display("s_output_z",s_output_z);
			done = 'd1;
			state <= get_a;
		end

		endcase

//						if (rset == 1)
//						begin
//							state <= get_a;
//							s_input_a_ack <= 0;
//							s_input_b_ack <= 0;
//						end
	//output_z = s_output_z;
	end

  
end
endmodule

