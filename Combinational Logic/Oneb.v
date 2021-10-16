`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2021 12:25:52 PM
// Design Name: 
// Module Name: Oneb
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
module Oneb(input [15:0] sw, output reg [6:0] seg,  reg[3:0] led);
reg [1:0] c;
reg [3:0] switch1, switch2, result;
always@(*)begin
c = sw[15:14];
switch1 = sw[3:0];
switch2 = sw[7:4];
if(c == 2'b01) begin
result = (switch1^switch2); //xor both inputs, but want 1 to turn on led and 0 to turn off, so use negate
seg[3:0] <= ~(result);
led <= (result);
seg[6:4] <= 3'b111; // this will allow only the 4 lsb to be shown
end
end
endmodule

