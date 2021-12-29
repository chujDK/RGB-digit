`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/24 20:56:29
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

// @input PAUSE         暂停按钮
// @input EN            整个系统的工作与否 1: 工作 0: 不工作
// @input clk
// @output AN[7:0]		 数码管位选
// @output DP1[7:0]      数码管段选
// @output DP2[7:0]      数码管段选
// @output Green1
// @output Red1
// @output Yellow1
// @output Green2
// @output Red2
// @output Yellow2
module Top(
    input PAUSE,EN,clk,
    output [7:0] AN,DP,
    output Green1,Red1,Yellow1,
    output Green2,Red2,Yellow2
    );

    wire [1:0] color_pulse;
    wire PAUSE_pulse,EN_pulse;
    wire PAUSE_IN;


    Eliminate_Shaking ES1(.key(EN),.clk(clk),.key_pulse(EN_pulse));
    Eliminate_Shaking ES2(.key(PAUSE),.clk(clk),.key_pulse(PAUSE_pulse));
    RGB rgb(PAUSE, 1, clk, AN, DP, Green1, Red1, Yellow1, Green2, Red2, Yellow2);

endmodule
