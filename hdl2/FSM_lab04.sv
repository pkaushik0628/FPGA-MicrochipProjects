`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 08:18:48 AM
// Design Name: 
// Module Name: FSM_lab04
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


module FSM_lab04(input logic clk, rst, enb2s, input logic [1:0] in, output logic dsel, c_f );


typedef enum logic [1:0] {
    time_s = 2'd0,
    fah_t = 2'd1,
    cel_t = 2'd2
} states_t;


states_t state, next;

always_ff @ (posedge clk)
    if (rst) state<= time_s;
    else state <= next;

always_comb
 
 
 begin 
    dsel = 1'b0;
    c_f = 1'b0;
    next = time_s;
 
 case(state)
 
 //Time displaying state starts
    time_s: begin
        dsel = 1'b0;
        c_f = 1'b0;
        if (enb2s && (in == 2'b11 || in == 2'b01)) next = fah_t;
        else if (enb2s && (in == 2'b10)) next = cel_t;
        else next = time_s;
    end
    fah_t: begin
        dsel = 1'b1;
        c_f = 1'b1;
        if (enb2s && (in == 2'b11 || in == 2'b10)) next = cel_t;
        else if (enb2s && (in == 2'b01)) next = time_s;
        else if(in == 2'b00) next = time_s;
        else next = fah_t;
end
 //celcius temperature begins
 cel_t: begin
        dsel = 1'b1;
        c_f = 1'b0;
        if (enb2s && (in == 2'b10 || in == 2'b11)) next = time_s;
        else if(in == 2'b00) next = time_s;
        else if(in == 2'b01) next = time_s;
        else next = cel_t;
    end
    
        endcase
    end
endmodule
