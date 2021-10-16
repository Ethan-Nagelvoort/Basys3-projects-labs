`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2021 04:02:13 PM
// Design Name: 
// Module Name: clk_div2
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


module clk_div2 (input clk, output reg slowerClk);
reg [31:0] counter;
always@(posedge clk) begin
if(counter == 25000000) begin//100000000 is threshold, it is close to 1 sec 6250000
slowerClk <= 1;//signal new clk signal
counter <= 0;
end
else begin
slowerClk <= 0;
counter <= counter+1;
end
end

endmodule
