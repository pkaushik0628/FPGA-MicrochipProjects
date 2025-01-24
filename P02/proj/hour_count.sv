`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2022 09:12:31 AM
// Design Name: 
// Module Name: hour_count
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


module hour_count(input logic clk, rst, enb, adv_hr,
    output logic [6:0] h0, h1, am_pm);

  

    always_ff @(posedge clk) begin
        if (rst) begin
            h0 = 7'd2;
            h1 = 7'd1;
            am_pm = 7'd10; // a = 10, p = 11
        end
        
        else if (enb) begin
        if(h1 == 7'd1 && h0 == 7'd1 && am_pm == 7'd11)
        begin
        h0 = 7'd2;
        h1 = 7'd1;
        am_pm = 7'd10;
        end
        
        else if(h1 == 7'd1 && h0 == 7'd1 && am_pm == 7'd10)
        begin
        h0 = 7'd2;
        h1 = 7'd1;
        am_pm = 7'd11;
        end
        
        else if(h0 <= 7'd8 && h1!=7'd1)
        begin
        h0 = h0 + 7'd1;
        h1 = 7'b1000000;
        end
        
        else if(h0 == 7'd9 && h1!=7'd1)
        begin
        h0 = 7'd0;
        h1 = 7'd1;
        end
        
        else if(h0 == 7'd0&&h1== 7'd1)
        begin
        h0 = 7'd1;
        h1 = 7'b1;
        end
        
        else if(h1 == 7'd1 && h0 == 7'd2)
        begin
        h0 = 7'd1;
        h1 = 7'b1000000;
        end
        
        end
    end
endmodule
