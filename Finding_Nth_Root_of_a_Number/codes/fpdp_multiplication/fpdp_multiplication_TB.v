//IEEE 754 double precision floating point multiplication
//https://babbage.cs.qc.cuny.edu/IEEE-754.old/64bit.html<----for verifying calculation

module fpdp_multiplication_TB;

wire [63:0]fpdp_product;
wire [3:0]done;

reg [63:0]fpdp_multiplier;
reg [63:0]fpdp_multiplicand;
reg [3:0]ready;
reg clk=0;
reg rset=1;

fpdp_multiplication dut (
    .fpdp_product(fpdp_product),
    .done(done),
    .fpdp_multiplier(fpdp_multiplier),
    .fpdp_multiplicand(fpdp_multiplicand),
    .ready(ready),
    .clk(clk),
    .rset(rset)
    );

always
#5 clk = ~clk;

initial
begin
#2 fpdp_multiplier <= 'b0_01111111110_1110000000000000000000000000000000000000000000000000; fpdp_multiplicand <= 'b0_01111111110_1010000000000000000000000000000000000000000000000000; ready<='d1;
#2 rset <= 0;
end

endmodule