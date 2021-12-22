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


// @input Duration[3:0] 每一种颜色的持续时间
// @input Color[1:0]    当前设置的是哪种颜色 00: red; 01: green; 11: yellow; 10: unused;
// @input SET           0->1: 进行设置
// @input EN            整个系统的工作与否 1: 工作 0: 不工作
module RGB(Duration, Color, SET, EN);
    input Duration, Color, SET, EN;
    wire [3:0] Duration;
    wire [1:0] Color;
endmodule
