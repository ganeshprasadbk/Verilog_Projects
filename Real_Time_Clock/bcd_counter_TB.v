//Test Bench for bcd_counter

`timescale 1ns/1ps
module bcd_counter_TB;

wire [3:0]count;
reg clk = 0;
reg rset = 1;
reg [3:0]mode;

bcd_counter dut( .count(count), .ov(ov), .clk(clk), .mode(mode), .rset(rset));

always@(clk)
#5 clk <= ~clk;

initial
begin
#12 rset <= 0;
$display("\nmod 2 counter: 0->1->0..");
mode <= 'd2; #(2*(2*10));

$display("\nmod 3 counter: 0->1->2->0");
mode <= 'd3; #(3*(2*10));

$display("\nmod 4 counter: 0->1->2->3->0");
mode <= 'd4; #(4*(2*10));

$display("\nmod 6 counter: 0->1->2->3->4->5->0");
mode <= 'd6; #(6*(2*10));

$display("\nmod 10(bcd) counter: 0->1->2->3->4->5->6->7->8->9->0");
mode <= 'd10; #(10*(2*10));
$stop;
end

initial
$monitor("clk_cycle=%d count=%d ov=%b rset=%b", ($time/10), count, ov, rset);

endmodule 