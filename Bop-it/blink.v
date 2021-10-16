`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2021 03:59:10 PM
// Design Name: 
// Module Name: blink
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


module blink(input clk, flash, output [15:0] l);
reg [15:0] blink = 1'b0000000000000000;
wire CLK;
clk_div2 DUT(.clk(clk), .slowerClk(CLK));
always@(posedge CLK) begin
if(flash) begin
blink <= ~blink;
end
else 
blink<= 0;
end
assign l = blink;
endmodule

