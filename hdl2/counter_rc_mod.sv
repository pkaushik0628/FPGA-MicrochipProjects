`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2022 08:37:02 AM
// Design Name: 
// Module Name: counter_rc_mod
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


module counter_rc_mod (
    input logic clk, rst, enb, adv_min,
    output logic [3:0] q,
    output logic cy
    );

    parameter MOD = 4'd10;

    assign cy = (q == MOD-1) && enb;

    always_ff @(posedge clk) begin
        if (rst || cy) q <= 0;
        else if (enb) q <= q + 1;
    end

endmodule