`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2021 01:12:59 PM
// Design Name: 
// Module Name: 7-seg
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


module an_controller(input [15:0] sw, input CLK, ampm, input [3:0] min1, min2, hour1, hour2, sec1, sec2, output reg [3:0] an, output reg [3:0] num, output reg flag);
reg[3:0] an_pos = 0;
wire CLK;
reg display_con = 1'b0;
always @(posedge CLK)
begin
display_con = sw[15];
if(display_con == 0) begin
flag <= 0;
    case (an_pos)
        4'b0000: begin
            an <= 4'b1110;
            num <= min1;
            an_pos <= 1;
            end
        4'b0001: begin
            an <= 4'b1101;
            num <= min2;
            an_pos <= 2;
            end
        4'b0010: begin
            an <= 4'b1011;
            num<= hour1;
            an_pos <= 3;
            end
        4'b0011: begin
            an <= 4'b0111;
            num <= hour2;
            an_pos <= 0;
            end
            endcase
end
else
begin
case (an_pos)
        4'b0000: begin
            an <= 4'b1110;
            num <= 4'b0010;//represents _
            flag <= 1;
            an_pos <= 1;
            end
        4'b0001: begin
            an <= 4'b1101;
            num <= ampm;//represents A or P
            flag <= 1;
            an_pos <= 2;
            end
        4'b0010: begin
            an <= 4'b1011;
            num<= sec1;
            flag <= 0;
            an_pos <= 3;
            end
        4'b0011: begin
            an <= 4'b0111;
            num <= sec2;
            flag <= 0;
            an_pos <= 0;
            end
            endcase
end
end

endmodule