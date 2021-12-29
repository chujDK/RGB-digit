`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/28 15:38:09
// Design Name: 
// Module Name: lightCTL_Test
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


module lightCTL_Test();
reg clk;
wire [5:0] d1,d2;
wire CP;

lightCTL tmp(.EN(1),.clk(clk),.displayer_1_time(d1),.displayer_2_time(d2), .CP(CP));

initial 
begin
    clk=0;
end
always 
begin
    #1;clk=~clk;
end
endmodule