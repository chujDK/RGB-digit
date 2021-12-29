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

// @input EN				使能
// @input clk
// @output AN
// @output DP
// @output Red1
// @output Green1
// @output Yellow1
// @output Red2
// @output Green2
// @output Yellow2
module lightCTL(PAUSE, EN, clk, AN, DP, Red1, Green1, Yellow1, Red2, Green2, Yellow2);
    input EN, clk, PAUSE;
    output AN, DP, Red1, Green1, Yellow1, Red2, Green2, Yellow2;

    reg Red1, Green1, Yellow1;
    reg Red2, Green2, Yellow2;

    reg [5:0] S0Duration;
    reg [5:0] S1Duration;
    reg [5:0] S2Duration;
    reg [5:0] S3Duration;
    reg [1:0] CurrentState;
    reg [5:0] CurrentTimeLeft; // 当前的时间
    reg [5:0] displayer_1_time;
    reg [5:0] displayer_2_time;
    wire [7:0] AN;
    wire [7:0] DP;

    wire CP;

    initial begin
        CurrentTimeLeft = 6'b000000;
        CurrentState =    2'b00;
        S0Duration =      6'b100010; // 34
        S1Duration =      6'b000100; // 4
        S2Duration =      6'b011000; // 24
        S3Duration =      6'b000100; // 4
        displayer_1_time = 6'b000000;
        displayer_2_time = 6'b000000;
        Red1 = 0;
        Yellow1 = 0;
        Green1 = 0;
        Red2 = 0;
        Yellow2 = 0;
        Green2 = 0;
    end

    clockOneSecond oneSecondTimer(
        .clk(clk),
        .EN(EN),
        .PAUSE(PAUSE),
        .CP(CP)
    );

    numberDisplay displayer(
        .Number1(displayer_1_time),
        .Number2(displayer_2_time),
        .AN(AN),
        .DP(DP),
        .clk(clk),
        .EN(EN)
    );

    always @(negedge CP) begin
        if (CurrentTimeLeft == 6'b000000)
        begin
            case(CurrentState)
                2'b00:
                begin
                // S0 -> S1 
                    CurrentTimeLeft <= S1Duration;
                    displayer_1_time <= S1Duration;
                    displayer_2_time <= S1Duration;
                    CurrentState <= 2'b01;
                    Red1 <= 0;
                    Green1 <= 0;
                    Yellow1 <= 1;
                    Red2 <= 1;
                    Green2 <= 0;
                    Yellow2 <= 0;
                end
                2'b01:
                begin
                // S1 -> S2 
                    CurrentTimeLeft <= S2Duration;
                    displayer_1_time <= S2Duration + 6'b000101;
                    displayer_2_time <= S2Duration;
                    CurrentState <= 2'b10;
                    Red1 <= 1;
                    Green1 <= 0;
                    Yellow1 <= 0;
                    Red2 <= 0;
                    Green2 <= 1;
                    Yellow2 <= 0;
                end
                2'b10:
                begin
                // S2 -> S3
                    CurrentTimeLeft <= S3Duration;
                    displayer_1_time <= S3Duration;
                    displayer_2_time <= S3Duration;
                    CurrentState <= 2'b11;
                    Red1 <= 1;
                    Green1 <= 0;
                    Yellow1 <= 0;
                    Red2 <= 0;
                    Green2 <= 0;
                    Yellow2 <= 1;
                end
                2'b11:
                begin
                // S3 -> S0
                    CurrentTimeLeft <= S0Duration;
                    displayer_1_time <= S0Duration;
                    displayer_2_time <= S0Duration + 6'b000101;
                    CurrentState <= 2'b00;
                    Red1 <= 0;
                    Green1 <= 1;
                    Yellow1 <= 0;
                    Red2 <= 1;
                    Green2 <= 0;
                    Yellow2 <= 0;
                end
            endcase
        end
        else
        begin
            CurrentTimeLeft <= CurrentTimeLeft - 6'b000001;
            displayer_1_time <= displayer_1_time - 6'b000001;
            displayer_2_time <= displayer_2_time - 6'b000001;
        end
    end
    
endmodule
