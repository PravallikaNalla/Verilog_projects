`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:21:11 05/10/2020 
// Design Name: 
// Module Name:    cordic_delta_i_gen 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cordic_delta_i_gen #(parameter WIDTH=16)(
    input [WIDTH-1:0] theta,
    input [WIDTH-1:0] alpha_i,
    input async_LD,
    input clk,
	 //output [WIDTH-1:0] e_i1, e_i,
    output delta
    );
	 
	 wire [WIDTH-1:0] e_i1, e_i;
	 assign delta = e_i[WIDTH-1];
	 register #(WIDTH) E_i(.in(e_i1), .N(theta), .async_LD(async_LD), .clk(clk), .out(e_i));
	 adder_subtractor #(WIDTH) CAS(.A(e_i), .B(alpha_i), .add_sub(~delta), .S(e_i1)); 

endmodule
