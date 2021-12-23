`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/23 13:41:47
// Design Name: 
// Module Name: dividerTest
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

`timescale 1ns/100ps                             //仿真时间单位/时间精度，时间单位要大于或者等于时间精度

module dividerTest();

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

    //module调用例化格式
    divider u1(                                  // 使用参数调用来获得其他比例的分配器，如 divider  #(.WIDTH(4),.N(10))  u1, N mod 2 == 0
        .clk	(clk),
        .EN	(rst_n),
        .CP	(clkout)   
        );
endmodule