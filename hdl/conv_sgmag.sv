`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2022 09:03:23 AM
// Design Name: 
// Module Name: conv_sgmag
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


module conv_sgmag(input logic [17:0] tx10, output logic sign, output logic [16:0] mag);

logic [16:0] tmp;

always_comb
begin
        sign = tx10[17];
 if(sign == 0)
        begin
             mag = tx10[16:0];
        end
        
else
        begin
             tmp = ~tx10[16:0];
             mag = tmp + 17'd1;
        end
end
endmodule
