`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2021 07:23:01 PM
// Design Name: 
// Module Name: source
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


module source(input [3:0] sw, output reg [6:0] seg, reg [3:0] an);
always@(*)begin
an <= 4'b1110;
case(sw)
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
 4'b1010: seg = 7'b1110111; // 1010
 4'b1011: seg = 7'b0011111; // 1011
 4'b1100: seg = 7'b1001110; // 1100
 4'b1101: seg = 7'b0111101; // 1101
 4'b1110: seg = 7'b1001111; // 1110
 4'b1111: seg = 7'b1000111; // 1111
 default: seg = 7'b1000000; // 0000
 endcase
end
endmodule
