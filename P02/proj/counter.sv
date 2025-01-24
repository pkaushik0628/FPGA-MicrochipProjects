`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2022 08:17:53 AM
// Design Name: 
// Module Name: counter
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


module  counter #(parameter W=4) (
    input logic clk, rst, enb,
    output logic [W-1:0] q
    );

    always_ff @(posedge clk)
        if (rst)      q <= '0;
        else if (enb) q <= q + 1;

endmodule: counter