`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 08:50:12 PM
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


module top(input [7:0] sw, input btnL, input clk, output [9:0] led);
wire RsTx;
wire [7:0] l;

tx DUT1 (.sw(sw), .btnL(btnL), .clk(clk), .RsTx(RsTx));

rx DUT2 (.RsRx(RsTx), .clk(clk), .l(l));

LED_controller DUT3 (.rx_led(l), .tx_led(RsTx), .led(led), .clk(clk));

endmodule
