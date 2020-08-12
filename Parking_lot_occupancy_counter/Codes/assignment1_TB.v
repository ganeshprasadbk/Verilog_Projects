//FSM for car parking Test Bench

`timescale 1ns/1ps
module assignment1_TB;

wire enter,exit;
wire [3:0]cntr;
//wire [2:0]state;

reg [1:0]ab;
reg clk,rset;

assignment1 dut (enter,exit,cntr,ab,clk,rset);

initial
begin
clk = 0;
end

always 
begin
#5 clk = ~clk;
end

initial 
begin

#10 rset = 1'b1;
#10 rset = 1'b0;
////////////
#10 ab<=2'b00;
#10 ab<=2'b00;
#10 ab<=2'b11;
#10 ab<=2'b00;
#10 ab<=2'b00;//inc=0;dec; cntr=0
//////////////
#11 ab<=2'b00;
#10 ab<=2'b10;
#16 ab<=2'b11;
#10 ab<=2'b01;
#19 ab<=2'b00;//inc=1; cntr=1
//////////////
#10 ab<=2'b00;
#13 ab<=2'b00;
#10 ab<=2'b10;
#10 ab<=2'b01;
#10 ab<=2'b00;//inc=0;dec=0; cntr=1
//////////////
#10 ab<=2'b00;
#10 ab<=2'b10;
#10 ab<=2'b11;
#10 ab<=2'b01;
#10 ab<=2'b00;//inc=1; cntr=2
//////////////
#10 ab<=2'b00;
#10 ab<=2'b10;
#10 ab<=2'b11;
#10 ab<=2'b01;
#10 ab<=2'b00;//inc=1; cntr=3
//////////////
#10 ab<=2'b00;
#10 ab<=2'b01;
#10 ab<=2'b11;
#10 ab<=2'b10;
#10 ab<=2'b00;//dec=1; cntr=2
//////////////
#10 ab<=2'b00;
#10 ab<=2'b10;
#10 ab<=2'b11;
#10 ab<=2'b01;
#10 ab<=2'b00;//inc=1; cntr=3
//////////////
#10 ab<=2'b00;
#10 ab<=2'b10;
#10 ab<=2'b11;
#10 ab<=2'b01;
#10 ab<=2'b00;//inc=1; cntr=4
//////////////
#10 ab<=2'b00;
#10 ab<=2'b10;
#10 ab<=2'b11;
#10 ab<=2'b01;
#10 ab<=2'b00;//inc=1; cntr=5
//////////////
#10 ab<=2'b00;
#10 ab<=2'b10;
#10 ab<=2'b11;
#10 ab<=2'b01;
#10 ab<=2'b00;//inc=1; cntr=6; led starts blinking
//////////////
#10 ab<=2'b00;
#10 ab<=2'b01;
#10 ab<=2'b11;
#10 ab<=2'b10;
#10 ab<=2'b00;//dec=1; cntr=5; led stops blinking
//////////////
#10 ab<=2'b00;
#10 ab<=2'b01;
#10 ab<=2'b11;
#10 ab<=2'b10;
#10 ab<=2'b00;//dec=1; cntr=4;
//////////////
#10 ab<=2'b00;
#10 ab<=2'b10;
#10 ab<=2'b11;
#10 ab<=2'b01;
#10 ab<=2'b00;//inc=1; cntr=5
//////////////
#10 ab<=2'b00;
#10 ab<=2'b10;
#10 ab<=2'b11;
#10 ab<=2'b01;
#10 ab<=2'b00;//inc=1; cntr=6; led starts blinking
//////////////
#10 ab<=2'b00;
#10 ab<=2'b01;
#10 ab<=2'b11;
#10 ab<=2'b10;
#10 ab<=2'b00;//dec=1; cntr=5; led stops blinking

end
endmodule