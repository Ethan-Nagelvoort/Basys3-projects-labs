`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2021 02:55:15 PM
// Design Name: 
// Module Name: Top
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


module Top(input [15:0] sw, input btnL, output [6:0] seg, output [3:0] an, output [3:0] led);
wire [6:0] a, b, c; 
OneA DUT (.sw(sw), .seg(a));

Oneb DUT1 (.sw(sw), .seg(b), .led(led));

OneC DUT2 (.sw(sw), .btnL(btnL), .seg(c));

mux DUT3 (.sw(sw), .seg(seg), .an(an), .a(a), .b(b), .c(c));


endmodule
