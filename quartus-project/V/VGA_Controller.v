// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date :| Changes Made:
//   V1.0 :| ??????????        :| ??/??/??  :| Initial Revision
//   V2.0 :| Rui Duarte        :| 16/03/14  :| X-Y coords
//	  V3.0 :| Tom Hartley		 :| 14/05/15  :| Improved frame rate, decreased frame shifting bugs
// --------------------------------------------------------------------
 



module	VGA_Controller(	//	Host Side
						iRed,
						iGreen,
						iBlue,
						oRequest,
						//	VGA Side
						oVGA_R,
						oVGA_G,
						oVGA_B,
						oVGA_H_SYNC,
						oVGA_V_SYNC,
						oVGA_SYNC,
						oVGA_BLANK,
						oVGA_CLOCK,
						oVGA_X,
						oVGA_Y,
						oVGA_ACTIVE,
						//	Control Signal
						iCLK,
						iRST_N,	
						gotSignal);

`include "VGA_Param.h"

//	Host Side
input		[9:0]	iRed;
input		[9:0]	iGreen;
input		[9:0]	iBlue;
output	reg			oRequest;
//	VGA Side
output		[9:0]	oVGA_R;
output		[9:0]	oVGA_G;
output		[9:0]	oVGA_B;
output	reg			oVGA_H_SYNC;
output	reg			oVGA_V_SYNC;
output				oVGA_SYNC;
output				oVGA_BLANK;
output				oVGA_CLOCK;
output  		[11:0]		oVGA_X;
output  		[11:0]		oVGA_Y;
output         	oVGA_ACTIVE;
output 	reg			gotSignal;



//	Control Signal
input				iCLK;
input				iRST_N;

//	Internal Registers and Wires
reg		[11:0]		H_Cont;
reg		[11:0]		V_Cont;
reg 				active;

assign	oVGA_BLANK	=	oVGA_H_SYNC & oVGA_V_SYNC;
assign	oVGA_SYNC	=	1'b0;
assign	oVGA_CLOCK	=	iCLK;

assign	oVGA_R	=	(	H_Cont>=X_START 	&& H_Cont<X_START+H_SYNC_ACT &&
						V_Cont>=Y_START 	&& V_Cont<Y_START+V_SYNC_ACT )
						?	iRed	:	0;
assign	oVGA_G	=	(	H_Cont>=X_START 	&& H_Cont<X_START+H_SYNC_ACT &&
						V_Cont>=Y_START 	&& V_Cont<Y_START+V_SYNC_ACT )
						?	iGreen	:	0;
assign	oVGA_B	=	(	H_Cont>=X_START 	&& H_Cont<X_START+H_SYNC_ACT &&
						V_Cont>=Y_START 	&& V_Cont<Y_START+V_SYNC_ACT )
						?	iBlue	:	0;

						
assign oVGA_X = 		H_Cont;				
assign oVGA_Y = 		V_Cont;				
assign oVGA_ACTIVE = active;
	
						
//	Pixel LUT Address Generator
always@(posedge iCLK or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		oRequest	<=	0;
	end
	else
	begin
		if(	H_Cont>=X_START-2 && H_Cont<X_START+H_SYNC_ACT-2 &&
			V_Cont>=Y_START && V_Cont<Y_START+V_SYNC_ACT )
		oRequest	<=	1;
		else
		oRequest	<=	0;
	end
end

//	H_Sync Generator, Ref. 25.175 MHz Clock
always@(posedge iCLK or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		H_Cont		<=	0;
		oVGA_H_SYNC	<=	0;
		active		<= 0;	//was 0
		gotSignal 	<= 0;
	end
	else
	begin
		//	H_Sync Counter
			
		if( H_Cont < H_SYNC_TOTAL )
		begin
			if ({iRed,iGreen,iBlue}==30'b000000000011111000000000000000)
			begin
				gotSignal <= 1'b1;
				H_Cont <= 10'd144;
				active <= 1'b1;
			end
			else
			begin
				gotSignal <= 1'b0;
				H_Cont	<=	H_Cont+1;
				active <= 1'b1;
			end
		end
		else
		begin
			H_Cont	<=	0;
			active <= 1'b0;			
		end
		//	H_Sync Generator
		if( H_Cont < H_SYNC_CYC )
			oVGA_H_SYNC	<=	0;
		else
			oVGA_H_SYNC	<=	1;
	end
end


//	V_Sync Generator, Ref. H_Sync
always@(posedge iCLK or negedge iRST_N)
begin

	if(!iRST_N)
	begin
		V_Cont		<=	0;
		oVGA_V_SYNC	<=	0;
	end
	else
	begin
		if ({iRed,iGreen,iBlue}==30'b000000000011111000000000000000)
			V_Cont <= 10'd35;
		//	When H_Sync Re-start
		else if(H_Cont==0)
		begin
			//	V_Sync Counter
			if( V_Cont < V_SYNC_TOTAL )
			V_Cont	<=	V_Cont+1;
			else
			V_Cont	<=	0;
			//	V_Sync Generator
			if(	V_Cont < V_SYNC_CYC )
			oVGA_V_SYNC	<=	0;
			else
			oVGA_V_SYNC	<=	1;
		end
	end
end

endmodule