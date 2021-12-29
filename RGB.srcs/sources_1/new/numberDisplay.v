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
// @input clk
// @output DP[7:0]
// @output AN2 High
// @output AN1 Low
module numberDisplay(EN, RESET, Number1, Number2, clk, DP, AN);
    input EN, RESET, Number1, Number2, clk;
    output DP, AN;
    wire [5:0] Number1;
    wire [5:0] Number2;
    wire [7:0] DP;
    reg [7:0] AN;

    wire CP;
    reg [5:0] NumberToDisplay;
    reg IsNumber1;
    reg IsHigh;

    initial begin
        IsHigh = 0;
        IsNumber1 = 0;
        NumberToDisplay = 0;
    end

    numberDisplayOne numberDisplayOne_uut(
        .EN(EN),
        .Number(NumberToDisplay),
        .DP(DP)
    );

    freshClock freshClock_uut(
        .EN(EN),
        .CP(CP),
        .clk(clk)
    );

    always @(posedge CP) begin
        if (IsNumber1)
        // number1
        begin
            if (IsHigh)
            begin
                AN <= 8'b11011111;
                // display high
                if(RESET==1'b1)
                    NumberToDisplay <= Number1 / 10;
                else
                    NumberToDisplay <= 6'b111111;
                IsHigh <= ~IsHigh;
            end
            else
            begin
                AN <= 8'b11101111;
                if(RESET==1'b1)
                    NumberToDisplay <= Number1 % 10;
                else
                    NumberToDisplay <= 6'b111111;
                IsHigh <= ~IsHigh;
                IsNumber1 <= 0;
            end
        end
        else
        begin
            if (IsHigh)
            begin
                AN <= 8'b11111101;
                // display high
                if(RESET==1'b1)
                    NumberToDisplay <= Number2 / 10;
                else
                    NumberToDisplay <= 6'b111111;
                IsHigh <= ~IsHigh;
            end
            else
            begin
                AN <= 8'b11111110;
                if(RESET==1'b1)
                    NumberToDisplay <= Number2 % 10;
                else
                    NumberToDisplay <= 6'b111111;
                IsHigh <= ~IsHigh;
                IsNumber1 <= 1;
            end
        end

    end
endmodule

