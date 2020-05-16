`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:49 05/13/2020 
// Design Name: 
// Module Name:    cordic_x_0sub_shiftedy 
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
module cordic_x_y_shift_add #(parameter WIDTH=16)(
    input signed [WIDTH-1:0] X,
    input signed [WIDTH-1:0] Y,
    input async_LD,
    input clk,
    input delta,
    input [3:0] i, //log_2(WIDTH)
	 //output signed [WIDTH-1:0] shift_x_i, shift_y_i,
    output signed [WIDTH-1:0] x_i,
    output signed [WIDTH-1:0] y_i
    );
	 
	 wire signed [WIDTH-1:0] x_i1, y_i1;
	 wire signed [WIDTH-1:0] shift_x_i, shift_y_i;
	 
	 assign shift_x_i = x_i >>> i;
	 assign shift_y_i = y_i >>> i;
	 
	 register #(WIDTH) X_(.in(x_i1), .N(X), .async_LD(async_LD), .clk(clk), .out(x_i));
	 register #(WIDTH) Y_(.in(y_i1), .N(Y), .async_LD(async_LD), .clk(clk), .out(y_i));
	 
	 adder_subtractor #(WIDTH) X_CAS(.A(x_i), .B(shift_y_i), .add_sub(~delta), .S(x_i1));
	 adder_subtractor #(WIDTH) Y_CAS(.A(y_i), .B(shift_x_i), .add_sub(delta), .S(y_i1));

endmodule
