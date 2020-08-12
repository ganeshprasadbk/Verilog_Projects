//RC Lab assignment 2-Floating-point Division
//remainder has been acheived as compared to assignment21
//made clean & compact 

module assignment23(Q,R,clk,rset,Num,Den);
output reg [15:0]Q,R;
input [15:0]Num;
input [15:0]Den;
input clk,rset;

reg [15:0]tempQ='d0;
reg [15:0]tempR='d0;
reg [15:0]N='d0;
reg [15:0]D='d0;

always@(posedge clk or posedge rset)
begin
	if(rset) begin Q<='d0; tempQ<='d0; N<=Num; D<= Den; end
	else
	begin
		if(N<D) begin tempQ <= tempQ; end
		else begin N <= N - D; tempQ <= tempQ + 1; end
		$display("N=%d, D=%d, tempQ=%d",N,D,tempQ);
	end
Q <= tempQ;
remainder(R,N,D);
end
////////////////////////////////////////////////////////////////////////////////////////////////
task remainder;

output [0:15]Rem;

input [15:0]tempRem;
input [15:0]D;

reg [15:0]M0,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14,M15;
reg [3:0]i;

begin
	M0<=Rem[0]==0?0:D;	M3<=Rem[3]==0?0:D;	M6<=Rem[6]==0?0:D;	M9<=Rem[9]==0?0:D;	M12<=Rem[12]==0?0:D;	M15<=Rem[15]==0?0:D;
	M1<=Rem[1]==0?0:D;	M4<=Rem[4]==0?0:D;	M7<=Rem[7]==0?0:D;	M10<=Rem[10]==0?0:D;	M13<=Rem[13]==0?0:D;	
	M2<=Rem[2]==0?0:D;	M5<=Rem[5]==0?0:D;	M8<=Rem[8]==0?0:D;	M11<=Rem[11]==0?0:D;	M14<=Rem[14]==0?0:D;	
	
	Rem[0] <=  tempRem<<1<D?0:1;
	$display("N=%d, D=%d, Rem0=%d, tempQ=%d",N,D,Rem[0],tempQ);

	//Rem[1] <= (((tempQ<<1)-M0)<<1)<D?0:1;
	Rem[1] <= ((tempRem<<2)-(M0<<1))<D?0:1;
	$display("N=%d, D=%d, Rem1=%d, tempQ=%d, M0=%d, M2=%d",N,D,Rem[1],tempQ,M0,M2);

	Rem[2] <= ((tempRem<<3)-(M0<<2)-(M1<<1))<D?0:1;
	$display("N=%d, D=%d, Rem2=%d, tempQ=%d, M1=%d",N,D,Rem[2],tempQ,M1);
	
	Rem[3] <= ((tempRem<<4)-(M0<<3)-(M1<<2)-(M2<<1))<D?0:1;

	Rem[4] <= ((tempRem<<5)-(M0<<4)-(M1<<3)-(M2<<2)-(M3<<1))<D?0:1;

	Rem[5] <= ((tempRem<<6)-(M0<<5)-(M1<<4)-(M2<<3)-(M3<<2)-(M4<<1))<D?0:1;

	Rem[6] <= ((tempRem<<7)-(M0<<6)-(M1<<5)-(M2<<4)-(M3<<3)-(M4<<2)-(M5<<1))<D?0:1;

	Rem[7] <= ((tempRem<<8)-(M0<<7)-(M1<<6)-(M2<<5)-(M3<<4)-(M4<<3)-(M5<<2)-(M6<<1))<D?0:1;

	Rem[8] <= ((tempRem<<9)-(M0<<8)-(M1<<7)-(M2<<6)-(M3<<5)-(M4<<4)-(M5<<3)-(M6<<2)-(M7<<1))<D?0:1;

	Rem[9] <= ((tempRem<<10)-(M0<<9)-(M1<<8)-(M2<<7)-(M3<<6)-(M4<<5)-(M5<<4)-(M6<<3)-(M7<<2)-(M8<<1))<D?0:1;

	Rem[10] <= ((tempRem<<11)-(M0<<10)-(M1<<9)-(M2<<8)-(M3<<7)-(M4<<6)-(M5<<5)-(M6<<4)-(M7<<3)-(M8<<2)-(M9<<1))<D?0:1;

	Rem[11] <= ((tempRem<<12)-(M0<<11)-(M1<<10)-(M2<<9)-(M3<<8)-(M4<<7)-(M5<<6)-(M6<<5)-(M7<<4)-(M8<<3)-(M9<<2)-(M10<<1))<D?0:1;

	Rem[12] <= ((tempRem<<13)-(M0<<12)-(M1<<11)-(M2<<10)-(M3<<9)-(M4<<8)-(M5<<7)-(M6<<6)-(M7<<5)-(M8<<4)-(M9<<3)-(M10<<2)-(M11<<1))<D?0:1;

	Rem[13] <= ((tempRem<<14)-(M0<<13)-(M1<<12)-(M2<<11)-(M3<<10)-(M4<<9)-(M5<<8)-(M6<<7)-(M7<<6)-(M8<<5)-(M9<<4)-(M10<<3)-(M11<<2)-(M12<<1))<D?0:1;

	Rem[14] <= ((tempRem<<15)-(M0<<14)-(M1<<13)-(M2<<12)-(M3<<11)-(M4<<10)-(M5<<9)-(M6<<8)-(M7<<7)-(M8<<6)-(M9<<5)-(M10<<4)-(M11<<3)-(M12<<2)-(M13<<1))<D?0:1;

	Rem[15] <= ((tempRem<<16)-(M0<<15)-(M1<<14)-(M2<<13)-(M3<<12)-(M4<<11)-(M5<<10)-(M6<<9)-(M7<<8)-(M8<<7)-(M9<<6)-(M10<<5)-(M11<<4)-(M12<<3)-(M13<<2)-(M14<<1))<D?0:1;
end
endtask

endmodule
