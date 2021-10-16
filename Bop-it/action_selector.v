`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2021 04:03:00 AM
// Design Name: 
// Module Name: action_selector
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


module action_selector(input btnR, btnU, btnL, btnC, btnD, clk, input [15:0] sw,  output reg [15:0] l, output wire b, output flash, output [6:0] points, output [6:0] points2, output reg [2:0] letter, output [6:0] hs);
wire CLK; 
reg busy = 0;
reg diff_sw = 0;
reg [3:0] rand = 2;
reg [2:0] rand3 = 1;
reg [3:0] rand2 = 1;
reg [4:0] lastRand = 1;
reg [3:0] counter = 0;
reg flag = 0;
reg blink = 0; 
reg [6:0] pcounter = 0;
reg [6:0] pholder = 0;
reg [6:0] pcounter2 = 0;
reg [6:0] high_score = 0;
reg fb;
reg [31:0] counter2 = 0;
clk_div3 DUT(.clk(clk), .slowerClk(CLK)); 
always@(posedge CLK) begin 
diff_sw <= sw[11];
counter2 <= counter2 +1;
if(blink==0) begin
if (rand>0 && rand<16) begin
case(rand)
1: begin
if(sw[0] == 1 && sw[10:1] == 0 && btnL == 0 && btnU == 0 && btnC == 0 && btnD == 0) begin
busy <= 0;
if(pcounter < 99)
pcounter <= pcounter + 1;
l[0] <= 1'b0;
flag <= 1;
counter <= 0;
if(diff_sw == 1)begin
if(({rand[2:0] , fb})>7) begin
rand <= {rand[2:0] , fb}/2-1;
end
else
rand <= {rand[2:0] , fb};
end
if(diff_sw ===0)begin
if(counter2%2==0) begin
rand <= {rand[2:0] , fb};
end
else begin
rand <= {rand[2:0] ,rand[4]^rand[3]};
end
end
end
else begin
letter <= 0;
busy <= 1;
l[0] <= 1'b1;
l[15:1] <= 0;
flag <= 0;
if(counter >= 1 && (sw[10:1] >= 1 || btnL == 1 || btnU == 1 || btnC == 1 || btnD == 1)) 
blink <= 1;
else
counter <= counter + 1;
end
end

2: begin
if(sw[1] ==1 && sw[0]==0 && sw[10:2] == 0 && btnL == 0 && btnU == 0 && btnC == 0 && btnD == 0) begin
l[1] <= 0;
busy <= 0;
flag <= 1;
if(pcounter < 99)
pcounter <= pcounter + 1;
counter <= 0;
if(diff_sw == 1)begin
if(({rand[2:0] , fb})>7) begin
rand <= ({rand[2:0] , fb})/2-1;
end
else
rand <= {rand[2:0] , fb};
end
if(diff_sw==0)begin
if(counter2%2==0) begin
rand <= {rand[2:0] , fb};
end
else begin
rand <= {rand[2:0] ,rand[4]^rand[3]};
end
end
end
else begin
letter <= 0;
busy <= 1;
l[1] <= 1'b1;
l[0] <= 0;
l[15:2] = 0;
flag <= 0;
if (counter>=1 && (sw[0]>=1 || sw[10:2] >= 1 || btnL == 1 || btnU == 1 || btnC == 1 || btnD == 1))
blink <= 1;
else
counter <= counter +1;
end
end

3: begin
if(sw[2] ==1 && sw[1:0] == 0 && sw[10:3] == 0 && btnL == 0 && btnU == 0 && btnC == 0 && btnD == 0) begin
l[2] <= 0;
busy <= 0;
flag <= 1;
if(pcounter < 99)
pcounter <= pcounter + 1;
counter <= 0;
if(diff_sw == 1)begin
if(({rand[2:0] , fb})>7) begin
rand <= ({rand[2:0] , fb})/2-1;
end
else
rand <= {rand[2:0] , fb};
end
if(diff_sw==0)begin
if(counter2%2==0) begin
rand <= {rand[2:0] , fb};
end
else begin
rand <= {rand[2:0] ,rand[4]^rand[3]};
end
end
end
else begin
letter <= 0;
busy <= 1;
l[2] <= 1'b1;
l[1:0] <= 0;
l[15:3] <= 0;
flag <= 0;
if(counter >= 1 && (sw[1:0] >= 1 || sw[10:3] >= 1 || btnL == 1 || btnU == 1 || btnC == 1 || btnD == 1))
blink <= 1;
else
counter <= counter +1;
end
end

4: begin
if(sw[3] ==1 && sw[2:0] == 0 && sw[10:4] == 0 && btnL == 0 && btnU == 0 && btnC == 0 && btnD == 0) begin
l[3] <= 0;
busy <= 0;
if(pcounter < 99)
pcounter <= pcounter + 1;
flag <= 1;
counter <= 0;
if(diff_sw == 1)begin
if(({rand[2:0] , fb})>7) begin
rand <= ({rand[2:0] , fb})/2-rand3;
end
else
rand <= {rand[2:0] , fb};
end
if(diff_sw==0)begin
if(counter2%2==0) begin
rand <= {rand[2:0] , fb};
end
else begin
rand <= {rand[2:0] ,rand[4]^rand[3]};
end
end
end
else begin
letter <= 0;
busy <= 1;
l[3] <= 1'b1;
l[2:0] <= 0;
l[15:4] <= 0;
flag <= 0;
if(counter>=1 && (sw[2:0] >= 1 || sw[10:4] >= 1 || btnL == 1 || btnU == 1 || btnC == 1 || btnD == 1))
blink <= 1;
else
counter <= counter +1;
end
end

5: begin
if(sw[4] ==1 && sw[10:5] == 0 && sw[3:0] == 0 && btnL == 0 && btnU == 0 && btnC == 0 && btnD == 0) begin
l[4] <= 0;
busy <= 0;
if(pcounter < 99)
pcounter <= pcounter + 1;
flag <= 1;
counter <= 0;
if(diff_sw == 1)begin
if(({rand[2:0] , fb})>7) begin
rand <= ({rand[2:0] , fb})/2-rand3;
end
else
rand <= {rand[2:0] , fb};
end
if(diff_sw==0)begin
if(counter2%2==0) begin
rand <= {rand[2:0] , fb};
end
else begin
rand <= {rand[2:0] ,rand[4]^rand[3]};
end
end
end
else begin
letter <= 0;
busy <= 1;
l[4] <= 1'b1;
l[3:0] <= 0;
l[15:5] <= 0;
flag <= 0;
if(counter >= 1 && (sw[10:5] >= 1 || sw[3:0] >= 1 || btnL == 1 || btnU == 1 || btnC == 1 || btnD == 1)) 
blink <= 1;
else
counter <= counter +1;
end
end

6: begin
if(sw[5] ==1 && sw[4:0] == 0 && sw[10:6] == 0 && btnL == 0 && btnU == 0 && btnC == 0 && btnD == 0) begin
l[5] <= 0;
busy <= 0;
if(pcounter < 99)
pcounter <= pcounter + 1;
flag <= 1;
counter <= 0;
if(diff_sw == 1)begin
if(({rand[2:0] , fb})>7) begin
rand <= ({rand[2:0] , fb})/2-rand3;
end
else
rand <= {rand[2:0] , fb};
end
if(diff_sw==0)begin
if(counter2%2==0) begin
rand <= {rand[2:0] , fb};
end
else begin
rand <= {rand[2:0] ,rand[4]^rand[3]};
end
end
end
else begin
letter <= 0;
busy <= 1;
l[5] <= 1'b1;
l[15:6] <= 0;
l[4:0] <= 0;
flag <= 0;
if(counter >= 1 && (sw[4:0] >= 1 || sw[10:6] >= 1 || btnL == 1 || btnU == 1 || btnC == 1 || btnD == 1))
blink <= 1;
else
counter <= counter +1;
end
end

7: begin
if(sw[6] ==1 && sw[5:0] == 0 && sw[10:7] == 0 && btnL == 0 && btnU == 0 && btnC == 0 && btnD == 0) begin
l[6] <= 0;
if(pcounter < 99)
pcounter <= pcounter + 1;
busy <= 0;
flag <= 1;
counter <= 0;
if(diff_sw == 1)begin
if(({rand[2:0] , fb})>7) begin
rand <= ({rand[2:0] , fb})/2-rand3;
end
else
rand <= {rand[2:0] , fb};
end
if(diff_sw==0)begin
if(counter2%2==0) begin
rand <= {rand[2:0] , fb};
end
else begin
rand <= {rand[2:0] ,rand[4]^rand[3]};
end
end
end
else begin
letter <= 0;
busy <= 1;
l[6] <= 1'b1;
l[5:0] <= 0;
l[15:7]<=0;
flag <= 0;
if(counter >= 1 && (sw[10:7] >= 1 || sw[5:0] >= 1 || btnL == 1 || btnU == 1 || btnC == 1 || btnD == 1)) 
blink <= 1;
else
counter <= counter +1;
end
end

8: begin
if(sw[7] ==1 && sw[6:0] == 0 && sw[10:8] == 0 && btnL == 0 && btnU == 0 && btnC == 0 && btnD == 0) begin
l[7] <= 0;
busy <= 0;
if(pcounter < 99)
pcounter <= pcounter + 1;
flag <= 1;
counter <= 0;
if(diff_sw == 1)begin
if(({rand[2:0] , fb})>7) begin
rand <= ({rand[2:0] , fb})/2-rand3;
end
else
rand <= {rand[2:0] , fb};
end
if(diff_sw==0)begin
if(counter2%2==0) begin
rand <= {rand[2:0] , fb};
end
else begin
rand <= {rand[2:0] ,rand[4]^rand[3]};
end
end
end
else begin
letter <= 0;
busy <= 1;
l[7] <= 1'b1;
l[6:0] <= 0;
l[15:8] <= 0;
flag <= 0;
if(counter>=1 && (sw[10:8] >= 1 || sw[6:0] >= 1 || btnL == 1 || btnU == 1 || btnC == 1 || btnD == 1)) 
blink <= 1;
else
counter <= counter +1;
end
end

9: begin
if(sw[8] ==1 && sw[7:0]==0 && sw[10:9] == 0 && btnL == 0 && btnU == 0 && btnC == 0 && btnD == 0) begin
l[8] = 0;
busy = 0;
if(pcounter < 99)
pcounter <= pcounter + 1;
flag <= 1;
counter <= 0;
if(diff_sw == 1)begin
if(({rand[2:0] , fb})>7) begin
rand <= ({rand[2:0] , fb})/2-rand3;
end
else
rand <= {rand[2:0] , fb};
end
if(diff_sw==0)begin
if(counter2%2==0) begin
rand <= {rand[2:0] , fb};
end
else begin
rand <= {rand[2:0] ,rand[4]^rand[3]};
end
end
end
else begin
letter <= 0;
busy <= 1;
l[8] = 1'b1;
l[15:9] <= 0;
l[7:0] <= 0;
flag <= 0;
if(counter>=1 && (sw[10:9] >= 1 || sw[7:0] >= 1 || btnL == 1 || btnU == 1 || btnC == 1 || btnD == 1)) 
blink <= 1;
else
counter <= counter +1;
end
end

10:begin
if(sw[10:0] == 0 && btnL == 1 && btnU == 0 && btnC == 0 && btnD == 0) begin
busy = 0;
letter <= 0;
if(pcounter < 99)
pcounter <= pcounter + 1;
flag <= 1;
counter <= 0;
if(diff_sw == 1)begin
if(({rand[2:0] , fb})>7) begin
rand <= ({rand[2:0] , fb})/2-rand3;
end
else
rand <= {rand[2:0] , fb};
end
if(diff_sw==0)begin
if(counter2%2==0) begin
rand <= {rand[2:0] , fb};
end
else begin
rand <= {rand[2:0] ,rand[4]^rand[3]};
end
end
end
else begin
letter <= 1;
busy <= 1;
flag <= 0;
if(counter>=1 && (sw[10:0] >= 1 || btnU == 1 || btnC == 1 || btnD == 1)) 
blink <= 1;
else
counter <= counter +1;
end
end

11:begin
if(sw[10:0] == 0 && btnL == 0 && btnU == 1 && btnC == 0 && btnD == 0) begin
busy = 0;
if(pcounter < 99)
pcounter <= pcounter + 1;
flag <= 1;
counter <= 0;
letter <= 0;
if(diff_sw == 1)begin
if(({rand[2:0] , fb})>7) begin
rand <= ({rand[2:0] , fb})/2-rand3;
end
else
rand <= {rand[2:0] , fb};
end
if(diff_sw==0)begin
if(counter2%2==0) begin
rand <= {rand[2:0] , fb};
end
else begin
rand <= {rand[2:0] ,rand[4]^rand[3]};
end
end
end
else begin
letter <= 2;
busy <= 1;
flag <= 0;
if(counter>=1 && (sw[10:0]>= 1 || btnL == 1 || btnC == 1 || btnD == 1)) 
blink <= 1;
else
counter <= counter +1;
end
end

12:begin
if(sw[10:0] == 0 && btnL == 0 && btnU == 0 && btnC == 1 && btnD == 0) begin
busy = 0;
if(pcounter < 99)
pcounter <= pcounter + 1;
flag <= 1;
letter <= 0;
counter <= 0;
if(diff_sw == 1)begin
if(({rand[2:0] , fb})>7) begin
rand <= ({rand[2:0] , fb})/2-rand3;
end
else
rand <= {rand[2:0] , fb};
end
if(diff_sw==0)begin
if(counter2%2==0) begin
rand <= {rand[2:0] , fb};
end
else begin
rand <= {rand[2:0] ,rand[4]^rand[3]};
end
end
end
else begin
letter <= 3;
busy <= 1;
flag <= 0;
if(counter>=1 && (sw[10:0]>= 1 || btnL == 1 || btnU == 1 || btnD == 1)) 
blink <= 1;
else
counter <= counter +1;
end
end

13:begin
if(sw[10:0] == 0 && btnL == 0 && btnU == 0 && btnC == 0 && btnD == 1) begin
busy = 0;
if(pcounter < 99)
pcounter <= pcounter + 1;
flag <= 1;
letter <= 0;
counter <= 0;
if(diff_sw == 1)begin
if(({rand[2:0] , fb})>7) begin
rand <= ({rand[2:0] , fb})/2-rand3;
end
else
rand <= {rand[2:0] , fb};
end
if(diff_sw==0)begin
if(counter2%2==0) begin
rand <= {rand[2:0] , fb};
end
else begin
rand <= {rand[2:0] ,rand[4]^rand[3]};
end
end
end
else begin
letter <= 4;
busy <= 1;
flag <= 0;
if(counter >=1 && (sw[10:0]>= 1 || btnL == 1 || btnU == 1 || btnC == 1)) 
blink <= 1;
else
counter <= counter +1;
end
end

14: begin
if(sw[9] ==1 && sw[8:0]==0 && sw[10] == 0 && btnL == 0 && btnU == 0 && btnC == 0 && btnD == 0) begin
l[9] = 0;
busy = 0;
if(pcounter < 99)
pcounter <= pcounter + 1;
flag <= 1;
counter <= 0;
if(diff_sw == 1)begin
if(({rand[2:0] , fb})>7) begin
rand <= ({rand[2:0] , fb})/2-rand3;
end
else
rand <= {rand[2:0] , fb};
end
if(diff_sw==0)begin
if(counter2%2==0) begin
rand <= {rand[2:0] , fb};
end
else begin
rand <= {rand[2:0] ,rand[4]^rand[3]};
end
end
end
else begin
letter <= 0;
busy <= 1;
l[9] = 1'b1;
l[15:10] <= 0;
l[8:0] <= 0;
flag <= 0;
if(counter>=1 && (sw[10] >= 1 || sw[8:0] >= 1 || btnL == 1 || btnU == 1 || btnC == 1 || btnD == 1)) 
blink <= 1;
else
counter <= counter +1;
end
end

15: begin
if(sw[10] ==1 && sw[9:0]==0  && btnL == 0 && btnU == 0 && btnC == 0 && btnD == 0) begin
l[10] = 0;
busy = 0;
if(pcounter < 99)
pcounter <= pcounter + 1;
flag <= 1;
counter <= 0;
if(diff_sw == 1)begin
if(({rand[2:0] , fb})>7) begin
rand <= ({rand[2:0] , fb})/2-rand3;
end
else
rand <= {rand[2:0] , fb};
end
if(diff_sw==0)begin
if(counter2%2==0) begin
if({rand[2:0] , fb} == 15)
rand <= rand2;
else
rand <= {rand[2:0] , fb};
end
else begin
if({rand[2:0] ,rand[4]^rand[3]}==15)
rand <= rand2;
else
rand <= {rand[2:0] ,rand[4]^rand[3]};
end
end
end
else begin
letter <= 0;
busy <= 1;
l[10] = 1'b1;
l[15:11] <= 0;
l[9:0] <= 0;
flag <= 0;
if(counter>=1 && (sw[9:0] >= 1 || btnL == 1 || btnU == 1 || btnC == 1 || btnD == 1)) 
blink <= 1;
else
counter <= counter +1;
end
end

default: begin
if(sw[0] == 1 && sw[10:1] == 0 && btnL == 0 && btnU == 0 && btnC == 0 && btnD == 0) begin
busy <= 0;
if(pcounter < 99)
pcounter <= pcounter + 1;
l[0] <= 1'b0;
flag <= 1;
counter <= 0;      
if(diff_sw == 1)begin
if(({rand[2:0] , fb})>7) begin
rand <= ({rand[2:0] , fb})/2-rand3;
end
else
rand <= {rand[2:0] , fb};
end
if(diff_sw==0)begin
if(counter2%2==0) begin
rand <= {rand[2:0] , fb};
end
else begin
rand <= {rand[2:0] ,rand[4]^rand[3]};
end
end
end
else begin
letter <= 0;
busy <= 1;
l[0] <= 1'b1;
l[15:1] <= 0;
flag <= 0;
if(counter>=1 && (sw[10:2] >= 1 || btnL == 1 || btnU == 1 || btnC == 1 || btnD == 1)) 
blink <= 1;
else
counter <= counter + 1;
end
end

endcase
end
else begin
rand <= rand2;
end
end
if(counter > 12) begin
blink <= 1;
end
if(blink ==1)
pholder <= pcounter;
if(high_score < pholder)
high_score <= pholder;
if(blink==1 && btnC == 1 && sw[13]==1 && sw[15]==0 && sw[14]==0)
high_score <= high_score + 1;
if(blink == 1 && btnC == 1 && sw[15] ==0 && sw[14]==0)
pcounter <= pcounter+1;
if(blink == 1 && btnD == 1 && sw[15] == 0 && sw[14]==0)
pcounter2 <= pcounter2 + 1;
if(btnR == 1 && blink == 1)
begin
blink <= 0;
counter <= 0;
pcounter2 <= pholder;
pcounter <= 0;
end
end
assign b = busy;
//assign flag2 = flag;
assign flash = blink;
assign points = pcounter;
assign points2 = pcounter2;
assign hs = high_score;
always @(posedge clk) begin
rand2 <= rand2 + 1;
rand3 <= rand3 +1;
if(rand2 == 15)
rand2 <= 1;
if(rand3 == 3)
rand3 <= 1;
end
always @(*)begin
fb = rand2[4]^rand2[3];
end

endmodule

