`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/22 18:57:30
// Design Name: 
// Module Name: RGB
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


// @input RESET         复位
// @input EN            整个系统的工作与否 1: 工作 0: 不工作
// @input clk
// @output AN[7:0]		 数码管位选
// @output DP[7:0]      数码管段选
// @output Green1
// @output Red1
// @output Yellow1
// @output Green2
// @output Red2
// @output Yellow2
module RGB(RESET, EN, clk, AN, DP, Green1, Red1, Yellow1, Green2, Red2, Yellow2);
    input RESET, EN, clk;
    output AN, DP, Green1, Red1, Yellow1, Green2, Red2, Yellow2;
    wire [7:0] AN;
    wire [7:0] DP;

    initial begin
    end

    lightCTL mainCTL(
        .EN(EN),
        .clk(clk),
        .AN(AN),
        .DP(DP),
        .Red1(Red1),
        .Green1(Green1),
        .Yellow1(Yellow1),
        .Red2(Red2),
        .Green2(Green2),
        .Yellow2(Yellow2)
    );

endmodule
