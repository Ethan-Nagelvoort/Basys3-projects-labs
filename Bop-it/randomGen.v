`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2021 04:04:21 AM
// Design Name: 
// Module Name: randomGen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module clock(input[15:0] sw, input clk,btnD, btnC, btnR, flash, output [3:0] min1, min2, sec1, sec2, min11, min22, sec11, sec22);
wire CLK;
clk_div DUT(.clk(clk), .slowerClk(CLK));
reg [6:0] cm = 6'b0000000; //min and sec counter
reg [6:0] cs = 6'b0000000;
reg [6:0] cm2 = 6'b0000000; //min and sec counter
reg [6:0] cs2 = 6'b0000000;
reg [6:0] cmholder = 6'b0000000; //min and sec counter
reg [6:0] csholder = 6'b0000000;
always@(posedge CLK) begin
if(btnR == 1)
begin
cm2 <= cmholder;
cs2 <= csholder;
cm <= 0;
cs <= 0;
end
if(btnR!=1) begin
if(flash != 1) begin
if(cm != 99 && cs != 59) begin
cs <= cs+1;
if(cs == 59) begin
cm <= cm + 1;
cs <= 0;
end
end
end
end
if(flash == 1)begin
cmholder <= cm;
csholder <= cs;
end
if(flash == 1 && sw[15] == 1 && sw[14]==0 && btnC==1)
cs<=sw[6:0];
if(flash == 1 && sw[15] == 1 && sw[14]==0 && btnD==1)
cm<=sw[6:0];
if(flash == 1 && sw[15] == 0 && sw[14]==1 && btnC==1)
cs2<=sw[6:0];
if(flash == 1 && sw[15] == 0 && sw[14]==1 && btnD==1)
cm2<=sw[6:0];
end
assign sec1 = cs%10;
assign sec2 = cs/10;
assign min1 = cm%10;
assign min2 = cm/10;
assign sec11 = cs2%10;
assign sec22 = cs2/10;
assign min11 = cm2%10;
assign min22 = cm2/10;
endmodule
