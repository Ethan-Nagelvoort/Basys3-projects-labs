`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2021 10:49:41 AM
// Design Name: 
// Module Name: OneA
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


module OneA(input [15:0] sw, output reg [6:0] seg);
reg [1:0] c;
reg [3:0] switch;
always@(*)begin
c = sw[15:14];
switch = sw[3:0];
if(c == 2'b00) begin
case(switch)
 4'b0000: seg = 7'b1000000; // 0000  
 4'b0001: seg = 7'b1111001; // 0001
 4'b0010: seg = 7'b0100100; // 0010
 4'b0011: seg = 7'b0110000; // 0011
 4'b0100: seg = 7'b0011001; // 0100
 4'b0101: seg = 7'b0010010; // 0101 
 4'b0110: seg = 7'b0000010; // 0110
 4'b0111: seg = 7'b1111000; // 0111 
 4'b1000: seg = 7'b0000000; // 1000 
 4'b1001: seg = 7'b0010000; // 1001
 4'b1010: seg = 7'b0001000; // 1010
 4'b1011: seg = 7'b0000011; // 1011
 4'b1100: seg = 7'b1000110; // 1100
 4'b1101: seg = 7'b0100001; // 1101
 4'b1110: seg = 7'b0000110; // 1110
 4'b1111: seg = 7'b0001110; // 1111  
 default: seg = 7'b1000000; // 0000
 endcase
end
end
endmodule
