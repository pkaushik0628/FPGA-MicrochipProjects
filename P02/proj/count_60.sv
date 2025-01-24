`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2022 08:59:40 AM
// Design Name: 
// Module Name: count_60
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


module count_60(input clk, rst, enb, adv_min, output logic cy, output logic [3:0] o1, o2);

logic link1;
counter_rc_mod U_clkcc1 (.clk, .rst, .enb,.adv_min(adv_min), .q(o1), .cy(link1));
counter_rc_mod #(.MOD(6)) U_clkcc2 (.clk, .rst, .enb(link1),.adv_min(1'd0), .q(o2), .cy);
endmodule
