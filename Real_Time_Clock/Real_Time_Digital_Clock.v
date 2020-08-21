/*This verilog code is the top-module for REAL TIME CLOCK. 
It includes two other modules
1. bcd_counter 
2. bcd_to_7segment_disp
*/

module Real_Time_Digital_Clock(output [6:0]HRM, HRL, MIN_M, MIN_L, SEC_M, SEC_L, input CLK, RST, format_ctrl);

wire [3:0]hrM, hrL, minM, minL, secM, secL;

wire [7:0]format;

wire ovhrM, ovhrL, ovminM, ovminL, ovsecM, ovsecL;

//format_ctrl=1:24-hr format clock
//format_ctrl=0:12-hr format clock
assign format = format_ctrl?8'b0011_0100:8'b0010_0011; 

//clock counting mechanism
bcd_counter hourM_cntr(.count(hrM), .ov(ovhrM), .clk(ovhrL), .mode(format[7:4]), .rset(RST));
bcd_counter hourL_cntr(.count(hrL), .ov(ovhrL), .clk(ovminM), .mode(format[3:0]), .rset(RST));
bcd_counter minuteM_cntr(.count(minM), .ov(ovminM), .clk(ovminL), .mode(4'd6), .rset(RST));
bcd_counter minuteL_cntr(.count(minL), .ov(ovminL), .clk(ovsecM), .mode(4'd10), .rset(RST));
bcd_counter secondM_cntr(.count(secM), .ov(ovsecM), .clk(ovsecL), .mode(4'd6), .rset(RST));
bcd_counter secondL_cntr(.count(secL), .ov(ovsecL), .clk(CLK), .mode(4'd10), .rset(RST));

//connecting clock counting mechanism to &-segment display
bcd_to_7segment_disp hourM(.out(HRM), .in(hrM));
bcd_to_7segment_disp hourL(.out(HRL), .in(hrL));
bcd_to_7segment_disp minuteM(.out(MIN_M), .in(minM));
bcd_to_7segment_disp minuteL(.out(MIN_L), .in(minL));
bcd_to_7segment_disp secondM(.out(SEC_M), .in(secM));
bcd_to_7segment_disp secondL(.out(SEC_L), .in(secL));

initial
//to dispaly time in transcript window in HH:MM:SS format
$monitor("%d%d : %d%d : %d%d",hrM, hrL, minM, minL, secM, secL); 

endmodule 
