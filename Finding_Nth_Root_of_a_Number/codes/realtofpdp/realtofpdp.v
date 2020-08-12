// real to double precision floating point converter
// for ex 26.93 then put intg=26 frac=93 dec_point_pos=100
// for ex 26.093 then put intg=26 frac=93 dec_point_pos=1000

module realtofpdp(fpdp,done,intg,frac,dec_point_pos,ready,clk,rset);

parameter p = 64;

output reg [63:0]fpdp='d0;
output reg [3:0]done='d0;

input [31:0]intg;
input [63:0]frac;
input [31:0]dec_point_pos;
input [3:0]ready;
input clk;
input rset;

reg [0:63]tempfrac;
reg [63:0]M[0:63];
reg [95:0]temp;
reg [8:0]i='d0;
reg [8:0]j='d0;
reg [10:0]exp='d0;
reg [51:0]mant='d0;
reg [63:0]D;
reg [63:0]k[0:63];

always@(posedge clk)
begin
	if(ready=='d1)
	begin	
		if(rset)
		begin
			//fpdp='d0; temp='d0; exp='d0; mant='d0;
		end
		else if(j<p)
		begin
			//dec2bin(tempfrac,'d0,frac,dec_point_pos,j);
			$display("taskdec:j=%d",j);
			tempfrac[0] =  frac<<1<dec_point_pos?0:1;
			$display("dec_point_pos=%d, tempfrac0=%d",dec_point_pos,tempfrac[0]);
			tempfrac[1] = ((frac<<2)-(M[0]<<1))<dec_point_pos?0:1;
			M[0]=(tempfrac[0]==0)?0:dec_point_pos;
			M[1]=(tempfrac[1]==0)?0:dec_point_pos;
			$display("dec_point_pos=%d, tempfrac1=%d, M[0]=%d",dec_point_pos,tempfrac[1],M[0]);
			k[0] = 'd0;
			k[1] = (M[0])<<1;
			$display("k[1]",k[1]);
			k[2] = (k[1] + M[1])<<1;
			$display("k[2]",k[2]);
			$display("insideif:j=%d",j);
			k[j] = (k[j-1] + M[j-1])<<1;
			tempfrac[j] = ((frac<<(j+1))-(k[j]))<dec_point_pos?0:1;
			M[j] = (tempfrac[j]==0)?0:dec_point_pos;
			$display("dec_point_pos=%d, tempfrac=%d, frac=%d",dec_point_pos,tempfrac[j],frac);
			$display("M[0]=%d, M[1]=%d, j=%d, M[j]=%d",M[0],M[1],j,M[j]);
			$display("k[0]=%d, k[1]=%d, k[2]=%d, j=%d, k[j]=%d",k[0],k[1],k[2],j,k[j]);
			j = j + 1;
		end
		else
		begin
			j = p;
			temp={intg,tempfrac};
			$display("temp=%b",temp);
			if(intg=='d0)
			begin
				if(temp[63-i]=='d1)
				begin
					temp=temp<<(33+i);
					mant[51:0]=temp[95:44];
					exp='d1023-'d1-i;
					i='d0;
					fpdp ={1'b0,exp,mant};
					done = 'd1;
				end
				else
					i=i+1;
			end
			else
			begin
				if(temp[95-i]=='d1)
				begin
					temp=temp<<(1+i);
					mant[51:0]=temp[95:44];
					exp='d1023+'d31-i;
					i='d0;
					fpdp ={1'b0,exp,mant};
					done = 'd2;
				end
				else
					i=i+1;
			end
		
		end
	end
end


/*
task dec2bin;

output [0:p-1]tempfrac;
output [p-1:0]M[0:p-1];
input [p-1:0]frac;
input [p-1:0]D;
input [p:0]j;

reg [p-1:0]M[0:p-1];
reg [p-1:0]k[0:p-1];

begin
	$display("taskdec:j=%d",j);
	tempfrac[0] =  frac<<1<D?0:1;
	$display("D=%d, tempfrac0=%d",D,tempfrac[0]);
	tempfrac[1] = ((frac<<2)-(M[0]<<1))<D?0:1;
	M[0]=(tempfrac[0]==0)?0:D;
	M[1]=(tempfrac[1]==0)?0:D;
	$display("D=%d, tempfrac1=%d, M[0]=%d",D,tempfrac[1],M[0]);
	k[0] = 'd0;
	k[1] = (M[0])<<1;
	$display("k[1]",k[1]);
	k[2] = (k[1] + M[1])<<1;
	$display("k[2]",k[2]);
	$display("insideif:j=%d",j);
	k[j] = (k[j-1] + M[j-1])<<1;
	tempfrac[j] = ((frac<<(j+1))-(k[j]))<D?0:1;
	M[j] = (tempfrac[j]==0)?0:D;
	$display("D=%d, tempfrac=%d, frac=%d",D,tempfrac[j],frac);
	$display("M[0]=%d, M[1]=%d, j=%d, M[j]=%d",M[0],M[1],j,M[j]);
	$display("k[0]=%d, k[1]=%d, k[2]=%d, j=%d, k[j]=%d",k[0],k[1],k[2],j,k[j]);
end
endtask
*/
endmodule
