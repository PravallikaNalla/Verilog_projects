`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:51:16 05/13/2020
// Design Name:   cordic_x_0sub_shiftedy
// Module Name:   C:/Users/pravnall/Documents/xilinx projects/test/cordic_x_y_shift_add_test.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cordic_x_0sub_shiftedy
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cordic_x_y_shift_add_test;

	// Inputs
	reg signed [15:0] X;
	reg signed [15:0] Y;
	reg async_LD;
	reg clk;
	reg delta;
	reg [3:0] i;

	// Outputs
	//wire [15:0] shift_x_i;
	//wire [15:0] shift_y_i;
	wire signed [15:0] x_i;
	wire signed [15:0] y_i;

	// Instantiate the Unit Under Test (UUT)
	cordic_x_y_shift_add uut (
		.X(X), 
		.Y(Y), 
		.async_LD(async_LD), 
		.clk(clk), 
		.delta(delta), 
		.i(i),
		//.shift_x_i(shift_x_i),
		//.shift_y_i(shift_y_i),
		.x_i(x_i), 
		.y_i(y_i)
	);
	
	initial begin
		clk = 1;
		forever #10 clk = ~clk;
		
	end
	
	initial begin
		// Initialize Inputs
		$monitor("-time:%d---| X:Y:LD = %d,%d,%b | delta:%b, i:%b| output: x_i:%d, y_i:%d",
							$time, X, Y, async_LD, delta,i,  x_i, y_i);
		X = -42;
		Y = -63;
		async_LD = 1;
		delta = 0;
		i = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		async_LD = 0;
        
		// Add stimulus here
		#20; i=i+1; delta = 1;
		#20; i=i+1; delta = 0;
		#20; i=i+1; delta = 0;
		#20; i=i+1; delta = 1;
		#20;
		$finish;

	end
      
endmodule

