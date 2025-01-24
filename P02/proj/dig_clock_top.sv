`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2022 10:45:19 AM
// Design Name: 
// Module Name: dig_clock_top
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


module dig_clock_top( input logic btn_1, btn_2, btn_d, clk, output logic [7:0] an_n, output logic [6:0] segs_n, output logic dp_n);

logic [6:0] i0, i1, i2, i3, i4, i5, i6;

dig_clock U_clock(.clk, .rst(btn_d), .adv_hr(btn_1), .adv_min(btn_2), .am_pm(i0), .s0(i1), .s1(i2), .m0(i3), .m1(i4), .h0(i5), .h1(i6));
sevenseg_ctl(.clk, .rst(btn_d), .d7(i6), .d6(i5), .d5(i4), .d4(i3),.d3(i2), .d2(i1), .d1(7'b1000000), .d0(i0),.segs_n,.an_n,.dp_n); 

endmodule


