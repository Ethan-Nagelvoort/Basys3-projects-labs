`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2021 09:39:40 AM
// Design Name: 
// Module Name: an_controller
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


module an_controller(input [15:0] sw, input [2:0] letter, input clk, flash, input [3:0] min1, min2, sec1, sec2, p1, p2, p3, p4, min11, min22, sec11, sec22, h1, h2, output reg [3:0] an, output reg [3:0] num, output reg other);
reg[3:0] an_pos = 0;
wire CLK;
reg display_con = 1'b0;
reg second_time = 1'b0;
reg hs_disp = 1'b0;
clk_div4 DUT(.clk(clk), .slowerClk(CLK));
always @(posedge CLK)
begin
display_con = sw[15];
second_time = sw[14];
hs_disp = sw[13];
if(display_con == 0 && second_time == 1 && hs_disp == 0) begin
other <= 0;
    case (an_pos)
        4'b0000: begin
            an <= 4'b1110;
            num <= sec11;
            an_pos <= 1;
            end
        4'b0001: begin
            an <= 4'b1101;
            num <= sec22;
            an_pos <= 2;
            end
        4'b0010: begin
            an <= 4'b1011;
            num<= min11;
            an_pos <= 3;
            end
        4'b0011: begin
            an <= 4'b0111;
            num <= min22;
            an_pos <= 0;
            end
            endcase
end
if(display_con == 1 && second_time == 0 && hs_disp==0) begin
other <= 0;
    case (an_pos)
        4'b0000: begin
            an <= 4'b1110;
            num <= sec1;
            an_pos <= 1;
            end
        4'b0001: begin
            an <= 4'b1101;
            num <= sec2;
            an_pos <= 2;
            end
        4'b0010: begin
            an <= 4'b1011;
            num<= min1;
            an_pos <= 3;
            end
        4'b0011: begin
            an <= 4'b0111;
            num <= min2;
            an_pos <= 0;
            end
            endcase
end
if(display_con == 0 && flash == 1 && second_time == 0 && hs_disp==0)
begin
other <= 0;
case (an_pos)
        4'b0000: begin
            an <= 4'b1110;
            num <= p3;
            an_pos <= 1;
            end
        4'b0001: begin
            an <= 4'b1101;
            num <= p4;
            an_pos <= 2;
            end
        4'b0010: begin
            an <= 4'b1011;
            num<= p1;
            an_pos <= 3;
            end
        4'b0011: begin
            an <= 4'b0111;
            num <= p2;
            an_pos <= 0;
            end
            endcase
end
if(display_con == 0 && flash == 1 && second_time == 0 && hs_disp==1)
begin
case (an_pos)
        4'b0000: begin
            an <= 4'b1110;
            num <= h1;
            an_pos <= 1;
            other <= 0;
            end
        4'b0001: begin
            an <= 4'b1101;
            num <= h2;
            other <= 0;
            an_pos <= 2;
            end
        4'b0010: begin
            an <= 4'b1011;
            num<= 6;
            other<=1;
            an_pos <= 3;
            end
        4'b0011: begin
            an <= 4'b0111;
            num <= 5;
            other<=1;
            an_pos <= 0;
            end
            endcase
end
if(display_con == 0 && flash == 0)
begin
case (an_pos)
        4'b0010: begin
            an <= 4'b1011;
            num <= p1;
            other <= 0;
            an_pos <= 1;
            end
        4'b0011: begin
            an <= 4'b0111;
            num <= p2;
            other <= 0;
            an_pos <= 2;
            end
        4'b0000: begin
            an <= 4'b1101;
            other<=1;
            num<= 0;
            an_pos <= 3;
            end
        4'b0001: begin
            an <= 4'b1110;
            other <= 1;
            num <= letter;
            an_pos <= 0;
            end
            endcase
end
end

endmodule