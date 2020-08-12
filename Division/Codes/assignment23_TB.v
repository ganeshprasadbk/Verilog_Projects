//RC Lab assignment 2-Floating-point Division TEST BENCH 

module assignment23_TB;


wire [15:0]Q,R;
reg [15:0]Num;
reg [15:0]Den;
reg clk,rset;

assignment23 dut (Q,R,clk,rset,Num,Den);

initial
begin
#5 rset <= 'd1;
#5 rset <= 'd0;
#5 clk = 'd0;
forever #10 clk = ~clk;
end


always
begin

#1 Num <= 'd27; Den <= 'd7;
end
endmodule
