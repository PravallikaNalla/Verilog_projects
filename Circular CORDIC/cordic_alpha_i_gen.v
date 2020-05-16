`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:24:39 05/16/2020 
// Design Name: 
// Module Name:    cordic_alpha_i_gen 
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
module cordic_alpha_i_gen(
    input [3:0] i,
	 //input clk,
    output [15:0] alpha_i
    );

	 
	 function [15:0] tanangle;
		input [3:0] a;
		begin
			 case (a)
			 0: tanangle = 16'd11520;  // theta = 45.000000
			 1: tanangle = 16'd6800;   // theta = 22.500000
			 2: tanangle = 16'd3593;   // theta = 11.250000
			 3: tanangle = 16'd1824;   // theta = 5.625000
			 4: tanangle = 16'd915;    // theta = 2.812500
			 5: tanangle = 16'd458;    // theta = 1.406250
			 6: tanangle = 16'd229;    // theta = 0.703125
			 7: tanangle = 16'd114;    // theta = 0.351562
			 8: tanangle = 16'd57;     // theta = 0.175781
			 9: tanangle = 16'd28;     // theta = 0.087891
			 10: tanangle = 16'd14;    // theta = 0.043945
			 11: tanangle = 16'd7;     // theta = 0.021973
			 12: tanangle = 16'd3;     // theta = 0.010986
			 13: tanangle = 16'd1;     // theta = 0.005493
			 14: tanangle = 16'd0;     // theta = 0.002747
			 15: tanangle = 16'd0;     // theta = 0.001373
			 default: tanangle = 111;
			 endcase
	   end
	 endfunction

	 assign alpha_i = tanangle(i);
	 /* 
	 always @(posedge clk)
	 begin
		$display("i value : %d",i);
		case (i)
			 0: alpha_i = 11520;  // theta = 45.000000
			 4'd1: alpha_i = 6800;   // theta = 22.500000
			 4'b0010: alpha_i = 3593;  // theta = 11.250000
			 3: alpha_i = 16'd1824;   // theta = 5.625000
			 4: alpha_i = 16'd915;    // theta = 2.812500
			 5: alpha_i = 16'd458;    // theta = 1.406250
			 6: alpha_i = 16'd229;    // theta = 0.703125
			 7: alpha_i = 16'd114;    // theta = 0.351562
			 8: alpha_i = 16'd57;     // theta = 0.175781
			 9: alpha_i = 16'd28;     // theta = 0.087891
			 10: alpha_i = 16'd14;    // theta = 0.043945
			 11: alpha_i = 16'd7;     // theta = 0.021973
			 12: alpha_i = 16'd3;     // theta = 0.010986
			 13: alpha_i = 16'd1;     // theta = 0.005493
			 14: alpha_i = 16'd0;     // theta = 0.002747
			 15: alpha_i = 16'd0;     // theta = 0.001373
			 default: alpha_i = 0;
		endcase
	 end
	 */


endmodule
