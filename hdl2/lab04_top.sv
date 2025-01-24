`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 08:05:40 AM
// Design Name: 
// Module Name: lab04_top
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


module lab04_top(input logic rst, btn_1, btn_2, clk, input logic [1:0] in,  output logic [7:0] an_n, output logic [6:0] segs_n, output logic dp_n,  inout tmp_scl, // use inout only - no logic
  inout tmp_sda);

logic [6:0] i0, i1, i2, i3, i4, i5, i6,t0,t1,t2,t3,t4,t5,t6,t7,r0,r1,r2,r3,r4,r5,r6,r7;
logic enb2s, c_f, dsel;
logic [6:0] d0, d1, d2, d3, d4, d5, d6, d7;



period_enb  #(.PERIOD_MS(2000)) U_period (.clk(clk), .rst(rst), .clr(1'b0), .enb_out(enb2s));
FSM_lab04 U_FSMCTL(.clk(clk), .rst(rst), .enb2s (enb2s), .in(in), .dsel(dsel), .c_f(c_f));



// r are for the times
always_comb 
begin
 r0 = i0 ;
 r1 = 7'b1000000 ;
 r2 = i1 ;
 r3 = i2 ;
 r4 = i3 ;
 r5 = i4 ;
 r6 = i5 ;
 r7 = i6 ;
end

always_comb
 begin
 if (dsel == 1)
 begin
 d0 = t0;
 d1 = t1;
 d2 = t2;
 d3 = t3;
 d4 = t4;
 d5 = t5;
 d6 = t6;
 d7 = t7;
 end
 
 else
 
 begin
 d0 = r0;
 d1 = r1;
 d2 = r2;
 d3 = r3;
 d4 = r4;
 d5 = r5;
 d6 = r6;
 d7 = r7;
 end
end
dig_clock U_clock(.clk(clk), .rst(rst), .adv_hr(btn_1), .adv_min(btn_2), .am_pm(i0), .s0(i1), .s1(i2), .m0(i3), .m1(i4), .h0(i5), .h1(i6));
lab03_top U_temp(.clk(clk),.rst(rst),.cf(c_f),.sel(1'b0),.tmp_sda,.tmp_scl, .inp(13'd0),.d0(t0),.d1(t1),.d2(t2),.d3(t3),.d4(t4),.d5(t5),.d6(t6),.d7(t7));

sevenseg_ctl U_sevenseg(.clk(clk), .rst(rst), .d7(d7), .d6(d6), .d5(d5), .d4(d4),.d3(d3), .d2(d2), .d1(d1), .d0(d0),.segs_n,.an_n,.dp_n); 

    
endmodule
