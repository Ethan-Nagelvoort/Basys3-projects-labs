`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2021 02:01:32 PM
// Design Name: 
// Module Name: clock_controller
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


module clock_controller(input clk, btnC, btnU, btnL, btnR, input [15:0] sw, output reg [5:0] overall_min, output reg alarmFlag, output reg [3:0] overall_hour, output reg [3:0] hour1, hour2, min1, min2, sec1, sec2, output reg ampm);
wire CLK;
reg flag; 
reg alarm_on = 1'b0;
reg [3:0] H1, H2, M1, M2, S1, S2 = 4'b0000;
reg [5:0] cm = 6'b000000; //min and sec counter
reg [5:0] cs = 6'b000000;
reg [3:0] ch = 4'b1100; // hour counter, start at 12
reg [5:0] min_secSW = 6'b000000;
reg ampmSW, pauseSW = 1'b0;
reg [3:0] hourSW = 4'b0000;
reg AP = 1'b1;
clk_div DUT(.clk(clk), .slowerClk(CLK));  
always@(posedge CLK) begin
alarm_on = sw[13];
min_secSW = sw [5:0];//first 6 switches used to manipulate minutes or seconds
hourSW = sw [9:6];//next 4 switches used to manipulate hours
ampmSW = sw[0]; // first switch controls weather in PM or AM
pauseSW = sw[14];//used to pause clock
if(btnR == 1)
AP <= ampmSW;
if(btnC == 1 && min_secSW <60)
cm <= min_secSW;
if(btnU == 1 && hourSW < 13 && hourSW != 0)
ch <= hourSW;
if(btnL == 1 && min_secSW <60)
cs <= min_secSW;
if(pauseSW == 0) begin //if 1 clock is paused
cs <= cs + 1;
if(cs == 59) begin
cm <= cm + 1;
cs <= 0;
end
if(cm == 59 && cs == 59)begin
ch <= ch+1;
cm <= 0;
end
if(ch == 12 && cm == 0 && cs == 0) begin
if(AP == 0)
AP <= 1;
if(AP == 1)
AP <= 0;
end
if(ch == 12 && cm==59 && cs == 59)begin
ch <= 1;
end
end
if(alarm_on == 1) begin
if(min_secSW == cm && hourSW == ch)
alarmFlag <= 1;
end
else
alarmFlag <= 0;
S1 <= cs%10;
S2 <= cs/10;
M1 <= cm%10;
M2 <= cm/10;
H1 <= ch%10;
H2 <= ch/10;
min1 <= M1;
min2 <= M2;
hour1 <= H1;
hour2 <= H2;
sec1 <= S1;
sec2 <= S2;
ampm <= AP;
overall_min <= cm;
overall_hour <= ch;
end
endmodule
