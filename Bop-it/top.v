`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2021 04:04:56 AM
// Design Name: 
// Module Name: top
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

module top(input clk, input btnR, btnC, btnL, btnD, btnU, input [15:0] sw, output [15:0] led, output [3:0] an, output [6:0] seg);
wire busy, other;
wire [2:0] letter;
wire [3:0] p1, p2, sec1, sec2, min1, min2, sec11, sec22, min11, min22, num, p3, p4, h1, h2;
wire [6:0] points, points2, hs;
wire flash, flag;
wire [15:0] l1, l2;
action_selector DUT1 (.hs(hs),.clk(clk), .btnR(btnR), .letter(letter), .btnC(btnC), .btnL(btnL), .btnD(btnD), .btnU(btnU), .points(points), .points2(points2), .sw(sw), .l(l1), .b(busy), .flash(flash));
points DUT2 (.h1(h1), .h2(h2), .counter(points), .p1(p1), .p2(p2), .p3(p3), .p4(p4), .counter2(points2), .hs(hs));
blink DUT3 (.clk(clk), .flash(flash), .l(l2));
multiplex DUT4(.clk(clk), .flash(flash), .l1(l1), .l2(l2), .led(led));
clock DUT5 (.sec11(sec11), .sec22(sec22), .min11(min11), .min22(min22),.sw(sw),.btnD(btnD), .btnC(btnC), .clk(clk), .btnR(btnR), .flash(flash), .sec1(sec1), .sec2(sec2), .min1(min1), .min2(min2));
an_controller DUT6 (.h1(h1), .h2(h2),.sec11(sec11), .sec22(sec22), .min11(min11), .min22(min22),.clk(clk), .letter(letter), .flash(flash), .sec1(sec1), .sec2(sec2), .min1(min1), .min2(min2), .p1(p1), .p2(p2), .p3(p3), .p4(p4), .sw(sw), .num(num), .an(an), .other(other));
seg_controller DUT7 (.num(num), .seg(seg), .other(other));
endmodule