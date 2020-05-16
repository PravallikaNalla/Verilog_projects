`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:52:22 05/09/2020 
// Design Name: 
// Module Name:    register 
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
module register #(parameter WIDTH=4)(
    input [WIDTH-1 : 0] in,
	 input [WIDTH-1 : 0] N,
    input async_LD,
	 input clk,
    output reg [WIDTH-1 : 0] out
    );
	 
	 always @(posedge clk or posedge async_LD)
	 begin
		if (async_LD)
			out <= N;
		else
			out <= in;
	 end

endmodule
