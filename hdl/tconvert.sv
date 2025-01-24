`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2022 08:32:02 AM
// Design Name: 
// Module Name: tconvert
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


module tconvert(input logic signed [12:0]tc,input logic c_f,
output logic signed [17:0]tx10 );

logic [17:0] tmp;

always_comb
begin
    if(c_f==0)
        begin
             tx10 = (tc<<3) + (tc<<1);
        end
    else
        begin
             tmp = ( (tc<<4) + (tc<<1) );
             tx10 = tmp + 18'd5120;
        end

end
endmodule
