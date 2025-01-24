`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2022 09:54:17 AM
// Design Name: 
// Module Name: hour_count_tb
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


module hour_count_tb;
logic clk, rst, enb;
logic [7:0] h0, h1, am_pm;

hour_count test(.clk, .rst, .enb, .h0, .h1, .am_pm);

always begin
    clk = 0; #5;
    clk = 1; #5;
end

initial begin
rst =1;
enb = 1;

#11
rst = 0;
enb = 1;

#250


$stop;
end

endmodule