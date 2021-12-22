`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/23 00:44:13
// Design Name: 
// Module Name: numberDisplay
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

// @input EN
// @input Number[3:0]
// @output DP[7:0]
// @output AN[7:0]
module numberDisplay(EN, Number, DP, AN);
    input EN, Number;
    output DP, AN;
    wire [3:0] Number;
    wire [7:0] DP;
    wire [7:0] AN;

    wire CP;

    numberDisplayOne numberDisplayOne_uut(
        .EN(EN),
        .Number(Number),
        .DP(DP)
    );

    freshClock freshClock_uut(
        .EN(EN),
        .CP(CP)
    )

    always @(/* pos or neg? */) begin
        if 
    end
endmodule

