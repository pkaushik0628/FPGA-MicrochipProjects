`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2022 08:37:58 AM
// Design Name: 
// Module Name: dig_clock
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

module dig_clock(input logic clk, rst, adv_hr, adv_min, output logic [6:0] s0, s1, m0, m1, h0, h1, am_pm);

logic enb1, trans1, trans2;
logic [6:0] s06,s16,m06,m16,h06,h16;
logic mdf_enb1, mdf_enb2;
always_comb
begin 
s0 = { 3'b010,s06  [3:0]};
s1 = { 3'b000,s16  [3:0]};
m0 = { 3'b010,m06 [3:0]};
m1 = { 3'b000,m16 [3:0]};
h0 = { 3'b010,h06 [3:0]};
h1 = {h16 [6], 2'b00,h16 [3:0]};
mdf_enb1 = (enb1&&adv_min)||trans1; 
mdf_enb2 = (enb1&&adv_hr)||trans2; 
end


period_enb #(.PERIOD_MS(1000)) U_period (.clk, .rst, .enb_out(enb1));
count_60 U_seconds (.clk, .rst, .enb(enb1), .o1(s06), .o2(s16), .cy(trans1), .adv_min(1'd0));
count_60 U_mins (.clk, .rst, .enb(mdf_enb1), .o1(m06), .o2(m16), .cy(trans2), .adv_min(adv_min));
hour_count U_hour (.clk, .rst, .enb(mdf_enb2),.adv_hr, .h0(h06), .h1(h16), .am_pm(am_pm));


endmodule
