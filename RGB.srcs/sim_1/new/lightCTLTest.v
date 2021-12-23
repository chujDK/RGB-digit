`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/23 16:13:56
// Design Name: 
// Module Name: lightCTLTest
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


module lightCTLTest();
    reg SET, EN, clk;
    wire Green, Red, Yellow;
    wire [7:0] AN;
    wire [7:0] DP;

    reg [3:0] R;
    reg [3:0] Y;
    reg [3:0] G;
    wire CP;
    wire [3:0] TL;

    initial begin
        R = 4'b0100;
        Y = 4'b0001;
        G = 4'b0011;
        EN = 1;
        clk = 0;
        SET = 0;
    end

    always #5 clk = ~clk;

    lightCTL mainCTL(
        .RedDuration(R),
        .GreenDuration(Y),
        .YellowDuration(G),
        .EN(EN),
        .clk(clk),
        .AN(AN),
        .DP(DP),
        .Red(Red),
        .Green(Green),
        .Yellow(Yellow),
        .CP(CP),
        .CurrentTimeLeft(TL)
    );

endmodule
