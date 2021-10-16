`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 01:51:49 PM
// Design Name: 
// Module Name: tx
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


module tx(input [15:0] sw, input clk, btnL, output reg RsTx);
parameter state1 = 2'b00;//idle time
parameter state2 = 2'b01;//state that indicates start of transmission
parameter state3 = 2'b10;//state that is longest, it transmitts the data. Uses a counter. 
parameter state4 = 2'b11;//state that indicates stop
wire CLK; 
reg [7:0] switch;
reg [1:0] current = 2'b00;
reg [2:0] counter = 3'b000;
reg [1:0] counter2 = 2'b00;
clk_divider  DUT(.clk(clk), .slowerClk(CLK));
always @(posedge CLK) begin
switch = sw[7:0]; //use first 8 switches
case(current)
state1: begin
RsTx <= 1'b1;//idle position, also counts as the second stop bit
if(btnL)begin
current <= state2;
end
end

state2: begin
RsTx <= 1'b0;//indicates the beginning of a transmission
current <= state3;
end

state3: begin
if(switch[counter] == 1'b1)begin
RsTx <= 1'b1;
end
else begin
RsTx <= 1'b0;
end

if(counter<3'b111) begin
counter <= counter + 3'b001;//use counter to go through the switches
end
else begin
counter <= 3'b000;
current = state4;
end
end

state4: begin
RsTx <= 1'b1;//stop bit, the other 1'b01 indicates the second stop bit
current <= state1;
end


endcase
end
endmodule


