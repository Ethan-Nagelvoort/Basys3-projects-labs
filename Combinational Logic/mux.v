`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2021 04:29:02 PM
// Design Name: 
// Module Name: mux
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


module mux(input [15:0] sw, input [6:0] a,b,c, output reg [6:0] seg, output reg [3:0] an);
reg [15:14] opt;
always@(*) begin
opt <= sw[15:14];
an <= 4'b1110;
if(opt == 2'b00)
 seg <= a;
else if(opt == 2'b01)
 seg <= b;
else if(opt == 2'b10)
 seg <= c;
else
 seg <= 7'b100000;
end

endmodule
