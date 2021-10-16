`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 08:57:46 PM
// Design Name: 
// Module Name: LED_controller
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


module LED_controller(input [7:0] rx_led, input tx_led, clk, output reg [9:0] led);
always @(posedge clk) begin
led [7:0] <= rx_led;
led [8] <= 1'b0;
led [9] <= tx_led;
end
endmodule
