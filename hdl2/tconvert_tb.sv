`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2022 08:52:38 AM
// Design Name: 
// Module Name: tconvert_tb
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


module tconvert_tb;

logic c_f;
logic signed [12:0] tc;
logic signed [17:0] tx10;

tconvert DUV(.c_f,.tc,.tx10);

initial begin 
c_f = 0;
tc = 50;
#10;
c_f = 0;
tc = 30;
#10
c_f = 1;
tc =100;
#10;
c_f = 1;
tc = 0;
#10;
tc = -10;
#10;
tc = -40;
#10



$stop;
end






endmodule
