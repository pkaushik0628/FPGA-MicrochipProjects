`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2022 08:38:44 AM
// Design Name: 
// Module Name: sevenseg_ctl
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


module sevenseg_ctl( input logic [6:0] d0, d1, d2, d3, d4, d5, d6, d7, input logic clk, rst, 
output logic [7:0] an_n,output logic [6:0] segs_n, output logic dp_n);

logic enb_out;
logic [2:0] q;
logic [6:0] muxd;



period_enb U_period (.clk(clk), .rst(rst), .clr(clr), .enb_out(enb_out));
counter U_count (.enb(enb_out), .rst(rst), .clk(clk), .q(q));
dec_3_8_n U_dec (.a(q), .y_n(an_n));
mux8 U_mux (.sel(q), .d0, .d1, .d2, .d3, .d4, .d5, .d6, .d7, .y(muxd));
seven_seg_n U_sevenseg (.data(muxd), .segs_n, .dp_n);

endmodule






