`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/23 14:19:21
// Design Name: 
// Module Name: clockOneSecond
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

// @input EN	使能
// @input clk
// @output CP	一秒一次的脉冲
module clockOneSecond(PAUSE, EN, clk, CP);
    input EN, clk, PAUSE;
    output CP;

    parameter WIDTH = 27;
    parameter N = 100000000; /* assert N mod 2 == 0 */

    reg [WIDTH - 1:0] cnt_pos; 
    reg clk_pos;

    initial begin
        cnt_pos = 0;
    end

    always @(posedge clk or negedge EN) begin
        if (!EN)
            cnt_pos <= 0;
        else if (!PAUSE)
            // do nothing
            cnt_pos <= cnt_pos;
        else if (cnt_pos == (N - 1))
            cnt_pos <= 0;
        else
            cnt_pos = cnt_pos + 1;
    end

    always @(posedge clk or negedge EN) begin
        if (!EN)
            clk_pos <= 0;
        else if (cnt_pos < (N >> 1))
            clk_pos <= 0;
        else
            clk_pos <= 1;
        
    end

    assign CP = clk_pos;

endmodule
