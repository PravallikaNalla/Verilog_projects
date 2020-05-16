`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:52:25 05/14/2020 
// Design Name: 
// Module Name:    CORDIC 
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

//multiply your theta in floating * 2^8, give that result as input
module CORDIC #(parameter WIDTH=16)(
    input signed [WIDTH-1:0] X,
    input signed [WIDTH-1:0] Y,
    input signed [WIDTH-1:0] theta,  //U[7:8] - 1 bit sign, 7bit dec, 8 bit floating
    input async_LD,
    input clk,
	 //output signed [WIDTH-1:0] alpha_i,
	 //output [3:0] i,
	 //output delta,
    output signed [WIDTH-1:0] x_i,
    output signed [WIDTH-1:0] y_i
    );
	 
	 wire signed [WIDTH-1:0] alpha_i;  //U[7:8] - 1 bit sign, 7bit dec, 8 bit floating
	 wire [3:0] i;
	 wire delta;   //1 bit sign of E - alpha/
	 
	 Binary_up_down_counter #(4) I(.sync_reset(0), .load(async_LD), .count(~async_LD), .up_down(0), .clk(clk), .N(WIDTH), .O(i));
	 
	 //function for aplha_i generation
	 //function [WIDTH-1:0] ;
	 function [15:0] tanangle;
		input [3:0] a;
		begin
			 case (a)
			 0: tanangle = 16'd11520;  // theta = 45.000000
			 1: tanangle = 16'd6800;   // theta = 26.56505   - tan_inv(2^(-a))
			 2: tanangle = 16'd3593;   // theta = 14.03624
			 3: tanangle = 16'd1824;   // theta = 7.125016
			 4: tanangle = 16'd915;    // theta = 3.57633
			 5: tanangle = 16'd458;    // theta = 1.78991
			 6: tanangle = 16'd229;    // theta = 0.89517
			 7: tanangle = 16'd114;    // theta = 0.44761
			 8: tanangle = 16'd57;     // theta = 0.22381
			 9: tanangle = 16'd28;     // theta = 0.11190
			 10: tanangle = 16'd14;    // theta = 0.05595
			 11: tanangle = 16'd7;     // theta = 0.02797
			 12: tanangle = 16'd3;     // theta = 0.01399
			 13: tanangle = 16'd1;     // theta = 0.00699
			 14: tanangle = 16'd0;     // theta = 0.00350
			 15: tanangle = 16'd0;     // theta = 0.00175
			 endcase
	   end
	 endfunction
	 assign alpha_i = tanangle(i);
	 //cordic_alpha_i_gen ALPHA(.i(i), .alpha_i(alpha_i));

	 cordic_delta_i_gen #(WIDTH) Delta(.theta(theta), .alpha_i(alpha_i), .async_LD(async_LD), .clk(clk), .delta(delta));

	 cordic_x_y_shift_add #(WIDTH) XY(.X(X), .Y(Y), .async_LD(async_LD), .clk(clk), .delta(delta), .i(i), .x_i(x_i), .y_i(y_i));
	 


	 
endmodule
