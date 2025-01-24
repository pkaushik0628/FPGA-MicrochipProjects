`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2022 10:15:40 AM
// Design Name: 
// Module Name: tdisplay_tb
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


module tdisplay_tb;

logic c_f;
logic signed [12:0] tc;
logic [3:0] thou, hund, tens, ones;
logic sign;

tdisplay DUV(.c_f,.tc,.thou,.hund,.tens,.ones,.sign);

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
c_f = 0;
tc = 0;
#10;
tc = -10;
#10;
tc = -40;
#10



$stop;
end






endmodule