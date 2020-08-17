`timescale 1ns/1ps
module johnson_counter_TB#(parameter n=9);

wire [n-1:0]Count_out;
reg rset=1;
reg clk=0;

johnson_counter dut(
    .clk(clk),
    .rset(rset),
    .Count_out(Count_out)
    );

initial
#(2*n+2) rset=0;

always @clk
#(n/2) clk <= ~clk;

initial
begin
$monitor("time=%d, Count_out=%b, reset=%b", $time, Count_out, rset);
#(2*n*n) $stop;
end

endmodule 