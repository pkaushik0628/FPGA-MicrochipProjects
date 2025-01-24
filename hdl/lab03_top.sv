`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 09/20/2022 08:06:33 AM
// Design Name:
// Module Name: lab03_top
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


module lab03_top(
  input logic clk, rst, cf,sel,
  input logic [12:0] inp,
  output logic [7:0] an_n,
  output logic [6:0] segs_n,
  output logic dp_n,
  inout tmp_scl, // use inout only - no logic
  inout tmp_sda // use inout only - no logic
  );

  logic tmp_rdy, tmp_err; // unused temp controller outputs
  // 13-bit two's complement result with 4-bit fractional part
  logic [12:0] temp1, temp;
  logic sign;
  logic [3:0] thou, hund, tens, ones;
  logic [6:0] d0, d1, d2, d3, d4, d5, d6, d7;

  // instantiate the VHDL temperature sensor controller
  TempSensorCtl U_TSCTL (
  .TMP_SCL(tmp_scl), .TMP_SDA(tmp_sda), .TEMP_O(temp),
  .RDY_O(tmp_rdy), .ERR_O(tmp_err), .CLK_I(clk),
  .SRST_I(rst)
  );


  always_comb
  begin
    if(sel)
    begin
      temp1 = inp;
    end
    else
    begin
      temp1 = temp;
    end
  end

  tdisplay(.tc(temp1), .c_f(cf), .sign(sign) ,.thou(thou), .hund(hund), .tens(tens), .ones(ones) );

  always_comb
  begin
    begin
      if(cf)
      d0 = 7'd15;
      else
      d0 = 7'd12;
    end


    if(sign)
    begin



      if(thou == 0 && hund == 0 && tens == 0)
      begin
        d1 = {3'b000, ones};
        d2 = {3'b010, tens};
        d3 = 7'b0010000;
        d4 = 7'b1000000;
        d5 = 7'b1000000;
      end

      else if(thou == 0 && hund == 0 && tens !=0)
      begin
        d1 = {3'b000, ones};
        d2 = {3'b010, tens};
        d3 = {3'b001, 4'b0000};
        d4 = 7'b1000000;
        d5 = 7'b1000000;
      end

      else if(thou == 0 && hund !=0 && tens!=0)
      begin
        d1 = {3'b000, ones};
        d2 = {3'b010, tens};
        d3 = {3'b000, hund};
        d4 = 7'b0010000;
        d5 = 7'b1000000;
      end
      
       else if(thou !=0 )
      begin
        d1 = {3'b000, ones};
        d2 = {3'b010, tens};
        d3 = {3'b000, hund};
        d4 = {3'b000, thou};
        d5 = 7'b0010000;
      end
    end
    else
    begin
    
    d5 = 7'b1000000;



      d2 = {3'b010, tens};


      if(hund == 4'd0 && thou == 0)
      begin
        d3 = 7'b1000000;
      end
      else
      begin
        d3 = {3'b000, hund};
      end

      if(thou == 4'd0)
      begin
        d4 = 7'b1000000;
      end
      else
      begin
        d4 = {3'b000, thou};
      end
    end
    
    d6 = 7'b1000000;
    d7 = 7'b1000000;

  end

  sevenseg_ctl( .d0(d0), .d1({3'b000, ones}), .d2(d2), .d3(d3), .d4(d4), .d5(d5), .d6(d6), .d7(d7), .clk(clk), .rst(rst),
  .an_n,.segs_n,  .dp_n);

endmodule
