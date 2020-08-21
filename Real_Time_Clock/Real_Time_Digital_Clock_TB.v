//Test Bench for Real_Time_Digital_Clock

`timescale 1ns/1ps

module Real_Time_Digital_Clock_TB;

wire [6:0]HRM, HRL, MIN_M, MIN_L, SEC_M, SEC_L;
reg CLK = 0;
reg RST = 1;
reg format_ctrl = 1;

Real_Time_Digital_Clock dut(.HRM(HRM),.HRL(HRL),.MIN_M(MIN_M),.MIN_L(MIN_L),.SEC_M(SEC_M),.SEC_L(SEC_L),.CLK(CLK),.RST(RST),.format_ctrl(format_ctrl));

//generate clock; here Period=2ns
//This clock is given as input to the 'seconds' counter
//Therefore 2ns = 1 second
always@(CLK)
#1 CLK <= ~CLK;

initial
begin
#3 RST <= 0; //Release reset after 1.5 seconds
#86402;
format_ctrl = 0;
#43202;
$stop;
end

endmodule 