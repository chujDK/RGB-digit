`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/22 19:33:18
// Design Name: RGB-digit
// Module Name: numberDisplay
// Project Name: RGB
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
// @output AN[7:0]		位选
// @output DP[7:0]		段选
module numberDisplay(EN, Number, AN, DP);
    input EN, Number, AN, DP;
    wire [3:0] Number;
    wire [7:0] AN;
    wire [7:0] DP;

    always @(Number) begin
        case (Number[3:0])
            
    end
endmodule
