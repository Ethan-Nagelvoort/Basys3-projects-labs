`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2021 09:49:51 AM
// Design Name: 
// Module Name: seg_controller
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


module seg_controller(input [3:0] num, input other, output reg[6:0] seg);

always @(*)
begin
if(other == 0) begin
    case(num)
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
        default: seg = 7'b1000000; // 0000
    endcase
end
else begin
 case(num)
        4'b0000: seg = 7'b1111111; // nothing on 
        4'b0001: seg = 7'b1000111; // L
        4'b0010: seg = 7'b1000001; // U
        4'b0011: seg = 7'b1000110; // C
        4'b0100: seg = 7'b0100001; // D
        4'b0101: seg = 7'b0001001; // H
        4'b0110: seg = 7'b1001111; // I
        default: seg = 7'b1111111; // nothing on
    endcase
end
end
endmodule
