`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2021 02:03:24 PM
// Design Name: 
// Module Name: OneC
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


module OneC(input [15:0] sw, input btnL, output reg [6:0] seg);
reg [1:0] c;
reg [3:0] switch1, switch2, result;
always@(*)begin
c = sw[15:14];
switch1 = sw[3:0];
switch2 = sw[7:4];
if(c == 2'b10) begin
if(btnL)begin
result = switch1+switch2; 
case(result)
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
end
endmodule
