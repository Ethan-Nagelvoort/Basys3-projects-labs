`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 01:54:17 PM
// Design Name: 
// Module Name: rx
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

module rx(input RsRx, input clk, output reg [7:0] l); 
reg [1:0] state = 2'b00;  
reg [7:0] ll = 8'b00000000;                           
reg [3:0] num = 4'b0000;//current switch            
reg [13:0] counter = 32'b0000000000000000000000000000000;  
wire CLK; 
clk_div2 DUT(.clk(clk), .slowerClk(CLK));   
always @(posedge CLK) begin
    case (state)
    2'b00: begin 
    l <= ll;
    if(RsRx == 1'b0) begin 
           state <= 2'b10;
           l <= 8'b00000000; 
    end 
     end
      2'b10: begin
         if (num <= 4'b1000) begin                     
                 ll[num] <= RsRx;
                 num <= num + 1;
             end 
             else begin   
                 state <= 2'b00;
                 num <= 4'b0000;
                 l <= ll;
        end
        end
        endcase
    end
    
endmodule

