`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2021 11:38:53 PM
// Design Name: 
// Module Name: alarm
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


module alarm(input CLK, input alarmFlag, output [15:0] led);
reg [15:0] blink = 1'b0000000000000000;
always@(posedge CLK) begin
if(alarmFlag) begin
blink <= ~blink;
end
else 
blink<= 0;
end
assign led = blink;
endmodule
