`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:12:20 05/01/2020 
// Design Name: 
// Module Name:    Binar_ripple_up_down_counter_4bit 
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
module Binary_up_down_counter #(parameter WIDTH=4)(
    input sync_reset,
    input load,
    input count,
    input up_down,
    input clk,
    input [WIDTH-1:0] N,
    output [WIDTH-1:0] O
    );

	 reg [WIDTH-1:0] temp;
	 
	 assign O = temp;
	 
	 always @(posedge clk)
	 if (sync_reset)
		temp <= 0;
	 else
		if (load)
			temp <= N;
		else
			if (count) begin
			//need begin end for this if - since it contains multiple line statements
				if (up_down)
					temp <= temp - 1;
				else
					temp <= temp + 1;
			end
	

endmodule
