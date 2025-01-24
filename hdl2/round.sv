`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2022 09:12:44 AM
// Design Name: 
// Module Name: round
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


module round(input logic [16:0] mag, output logic [12:0] rounded );

always_comb
    begin
         if(mag[3]== 1'd1)
            begin
                rounded = mag[16:4] + 13'd1;
            end
         else
         
             begin
                 rounded = mag[16:4];
              end
     end

endmodule
