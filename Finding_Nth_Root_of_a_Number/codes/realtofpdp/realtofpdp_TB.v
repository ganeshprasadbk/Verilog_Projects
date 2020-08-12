// real to double precision floating point converter Test Bench
// for ex 26.93 then put intg=26 frac=93 dec_point_pos=100
// for ex 26.093 then put intg=26 frac=93 dec_point_pos=1000

module realtofpdp_TB;

wire [63:0]fpdp;
wire [3:0]done;

reg [31:0]intg;
reg [63:0]frac;
reg [31:0]dec_point_pos;
reg [3:0]ready='d1;
reg clk='d0;
reg rset='d1;

realtofpdp dut (
    .fpdp(fpdp),
    .done(done),
    .intg(intg),
    .frac(frac),
    .dec_point_pos(dec_point_pos),
    .ready(ready),
    .clk(clk),
    .rset(rset)
    );

always
#5 clk = ~clk;

initial
begin
#1 intg = 'd9545; frac='d435766; dec_point_pos='d1000000;
#6 rset = 'd0;
end
endmodule
