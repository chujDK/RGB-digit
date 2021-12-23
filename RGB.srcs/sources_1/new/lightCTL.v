`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/23 14:50:30
// Design Name: 
// Module Name: lightCTL
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

// @input RedDuration[3:0]
// @input GreenDuration[3:0]
// @input YellowDuration[3:0]
// @input EN				使能
// @input clk
// @output AN
// @output DP
// @output Red
// @output Green
// @output Yellow
module lightCTL(RedDuration, GreenDuration, YellowDuration, EN, clk, AN, DP, Red, Green, Yellow);
    input RedDuration, GreenDuration, YellowDuration, EN, clk;
    output AN, DP, Red, Green, Yellow; 

    reg Red, Green, Yellow;

    wire [3:0] RedDuration;
    wire [3:0] GreenDuration;
    wire [3:0] YellowDuration;
    reg [1:0] CurrentColor;     // 00: green, 01: yellow, 10: red
    reg [3:0] CurrentCountDown; // 当前倒计时的起点
    wire [3:0] CurrentTimeLeft; // 当前的时间
    wire [7:0] AN;
    wire [7:0] DP;

    reg LD_, CT_, UD;
    wire CP;

    initial begin
        CurrentCountDown = 4'b0000;
        CurrentColor = 2'b10;
        LD_ = 1;
        CT_ = 0;
        UD = 1;
    end

    clockOneSecond oneSecondTimer(
        .clk(clk),
        .EN(EN),
        .CP(CP)
    );


    m74LS191 counter(
        .LD_(LD_),
        .CT_(CT_),
        .UD(UD),
        .CP(CP),
        .D(CurrentCountDown),
        .Q(CurrentTimeLeft)
    );

    numberDisplay displayer(
        .Number(CurrentTimeLeft),
        .AN(AN),
        .DP(DP),
        .clk(clk),
        .EN(EN)
    );

    always @(CurrentTimeLeft or EN) begin
        if (EN)
        begin
            if (CurrentTimeLeft == 4'b0000)
            begin
                case(CurrentColor)
                    2'b00:
                    begin
                    // green -> yellow
                        CurrentCountDown = YellowDuration;
                        CurrentColor = 2'b01;
                        Red = 0;
                        Green = 0;
                        Yellow = 1;
                    end
                    2'b01:
                    begin
                    // yellow -> red
                        CurrentCountDown = RedDuration;
                        CurrentColor = 2'b10;
                        Red = 1;
                        Green = 0;
                        Yellow = 0;
                    end
                    2'b10:
                    begin
                    // red -> green
                        CurrentCountDown = GreenDuration;
                        CurrentColor = 2'b00;
                        Red = 0;
                        Green = 1;
                        Yellow = 0;
                    end
                endcase
                LD_ = 0; // do set
            end
            LD_ = 1;
        end
        else
        begin
            // disable
            Red = 0;
            Green = 0;
            Yellow = 0;
            CurrentColor = 2'b00;
        end
    end
    
endmodule
