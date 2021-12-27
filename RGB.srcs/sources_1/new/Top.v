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


module Top(
    input [3:0] Duration,
    input [1:0] color,
    input SET,EN,clk,
    output [7:0] AN,DP,
    output Green,Red,Yellow
    );

    wire [1:0] color_pulse;
    wire SET_pulse,EN_pulse;
    reg [3:0] RedDuration;
    reg [3:0] GreenDuration;
    reg [3:0] YellowDuration;

    Eliminate_Shaking ES1(.key(color[0]),.clk(clk),.key_pulse(color_pulse[0])),
                      ES2(.key(color[1]),.clk(clk),.key_pulse(color_pulse[1])),
                      ES3(.key(SET),.clk(clk),.key_pulse(SET_pulse)),
                      ES4(.key(EN),.clk(clk),.key_pulse(EN_pulse));
    RGB rgb(Duration, color_pulse, SET_pulse, EN_pulse, clk, AN, DP, Green, Red, Yellow);



endmodule
