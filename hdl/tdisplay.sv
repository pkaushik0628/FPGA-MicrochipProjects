`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2022 10:07:41 AM
// Design Name: 
// Module Name: tdisplay
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


module tdisplay(input logic [12:0] tc, input logic c_f, output logic sign ,output logic [3:0] thou, hund, tens, ones  );

logic [17:0] tx10;
logic [16:0] mag;
logic [12:0] rounded;

tconvert U_tcon(.tc,.c_f,.tx10(tx10));

conv_sgmag U_cs(.tx10(tx10),.sign,.mag(mag));

round U_r(.mag(mag),.rounded(rounded));

dbl_dabble_ext U_dde(.b(rounded),.thousands(thou),.hundreds(hund),.tens,.ones);




endmodule
