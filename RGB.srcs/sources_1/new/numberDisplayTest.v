`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/23 12:37:30
// Design Name: 
// Module Name: numberDisplayTest
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


module numberDisplayTest(
    AN, DP, clk
    );
    input clk;
    output AN, DP;
    wire [7:0] AN;
    wire [7:0] DP;

    // numberDisplay test
    numberDisplay display_uut(
        .EN(1),
        .Number1(5'b10101),
        .Number2(5'b01111),
        .clk(clk),
        .DP(DP),
        .AN(AN)
    );

/*  // numberDisplayOne test
    assign AN = 8'b11111110;

    numberDisplayOne numberDisplayOne_uut(
        .EN(1),
        .Number(Duration),
        .DP(DP)
    );
*/
endmodule
