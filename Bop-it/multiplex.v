`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2021 04:18:37 PM
// Design Name: 
// Module Name: multiplex
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


module multiplex(input [15:0] l1, l2, input flash, clk, output reg [15:0] led);
always@(posedge clk) begin
if(flash)
led <= l2;
else
led <= l1;
end
endmodule
