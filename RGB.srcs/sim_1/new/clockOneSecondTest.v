`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/23 14:22:29
// Design Name: 
// Module Name: clockOneSecondTest
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


module clockOneSecondTest();

    reg    clk,rst_n;
    wire   clkout;

//初始化过程块
    initial 
    begin 
        clk = 0;
        rst_n = 0;
        #25                                      //#表示延时25个时间单位
        rst_n = 1;                               //产生了一个初始25ns低电平，然后变高电平的复位信号
    end

    always #5 clk = ~clk;                          //每隔5ns翻转一次clk信号，也就是产生一个时钟周期10ns的clk，频率为100MHz  

    clockOneSecond cos(
        .EN(rst_n),
        .clk(clk),
        .CP(clkout)
    );
endmodule
