`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2022 08:13:53 AM
// Design Name: 
// Module Name: period_enb
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


module period_enb(input logic clk, rst, clr, output logic enb_out);
    parameter PERIOD_MS = 1;   // override ONE of the three delay parameters
    parameter PERIOD_US = PERIOD_MS * 1000;
    parameter PERIOD_NS = PERIOD_US * 1000;
    parameter CLKFREQ_MHZ = 100;  // default matches Nexys4 clock

    localparam CLKPD_NS = 1000 / CLKFREQ_MHZ;
    localparam PERIOD_COUNT_LIMIT = PERIOD_NS / CLKPD_NS;
    localparam PERIOD_COUNT_BITS = $clog2(PERIOD_COUNT_LIMIT);

    logic [PERIOD_COUNT_BITS-1:0] q;

    assign enb_out = (q == PERIOD_COUNT_LIMIT - 1);

    always_ff @(posedge clk)
        if (rst || clr || enb_out) q <= 0;
        else                       q <=  q + 1;

endmodule: period_enb