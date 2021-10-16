`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2021 04:53:49 PM
// Design Name: 
// Module Name: timer
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

module points(input [6:0] counter, input [6:0] counter2, hs, output [3:0] p1, p2, p3, p4, h1, h2);
assign p1 = counter%10;
assign p2 = counter/10;
assign p3 = counter2%10;
assign p4 = counter2/10;
assign h1 = hs%10;
assign h2 = hs/10;
endmodule