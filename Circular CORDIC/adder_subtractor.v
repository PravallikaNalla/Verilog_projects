`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:42:57 05/10/2020 
// Design Name: 
// Module Name:    adder_subtractor 
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
module adder_subtractor #(parameter WIDTH=16)(
    input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,
    input add_sub,
    output reg [WIDTH-1:0] S
    );
	 
	 always @*
	 begin
		if (add_sub)
			S = A-B;
		else
			S = A+B;
	 end

endmodule
