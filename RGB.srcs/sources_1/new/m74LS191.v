`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/07 14:12:16
// Design Name: 
// Module Name: 74LS191
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


module m74LS191(LD_, CT_, UD, CP, D, Q);
    input LD_;
    input CT_;
    input UD;
    input CP;
    input [3:0] D;
    output[3:0] Q;
    reg [3:0] Q;

    always @(posedge CP or negedge LD_) begin
        if (!LD_)
            Q <= D;
        else if (!CT_)
            if (!UD)
                Q <= Q + 4'b0001;
            else
                Q <= Q - 4'b0001;
    end
endmodule
