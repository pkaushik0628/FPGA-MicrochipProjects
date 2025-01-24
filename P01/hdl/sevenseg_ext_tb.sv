`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2022 09:15:39 AM
// Design Name: 
// Module Name: sevenseg_ext_tb
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


module sevenseg_ext_tb;
logic [6:0] data,segs_n;
logic dp_n;

seven_seg_n test(.data,.segs_n,.dp_n);

initial begin 

data[6] = 1'b1;
#10

data[6] = 1'b0;
data[5] = 1'b1;

#10

data[6] = 1'b0;
data[5] = 1'b0;
data[4] = 1'b1;

#10

data[6] = 1'b0;
data[5] = 1'b0;
data[4] = 1'b0;

data[3:0] = 4'd15;

#10

data[6] = 1'b0;
data[5] = 1'b0;
data[4] = 1'b0;

data[3:0] = 4'd12;

#10

data[6] = 1'b0;
data[5] = 1'b0;
data[4] = 1'b0;

data[3:0] = 4'd10;

$stop;
end

endmodule
