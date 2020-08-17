`timescale 1ns/1ns
module n_bit_ring_counter_TB#(parameter n = 4);
wire [n-1:0]ring_out;
reg clk=0;
reg rset=1;

n_bit_ring_counter dut(.ring_out(ring_out),.clk(clk),.rset(rset));
  
always @clk
#(n/2) clk <= ~ clk;
  
initial
begin
#(n+1) rset = 0;
#(n*n)$stop;
end

initial
$monitor("time=%d, ring_out=%b, resest=%b", $time, ring_out, rset);

endmodule 