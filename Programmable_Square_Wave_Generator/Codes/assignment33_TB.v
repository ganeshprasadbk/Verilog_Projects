
module assignment33_TB;
reg [3:0]M;
reg [3:0]N;
reg clk;
reg rst=1;

wire var_clk;

assignment33 dut(M,N,clk,rst,var_clk);

initial
begin
clk=1'b0;
end

always
begin
#5 clk=~clk;
end

initial
begin
#2 M<='d11; N<='d15;
#15 rst=1'b0;

end
endmodule
