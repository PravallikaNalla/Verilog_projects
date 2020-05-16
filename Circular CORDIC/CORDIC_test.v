`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:22:47 05/14/2020
// Design Name:   CORDIC
// Module Name:   C:/Users/pravnall/Documents/xilinx projects/test/CORDIC_test.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CORDIC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CORDIC_test;

	// Inputs
	reg signed [15:0] X;
	reg signed [15:0] Y;
	reg signed[15:0] theta;
	reg async_LD;
	reg clk;

	// Outputs
	 //wire signed [15:0] alpha_i;  //U[8:7]- 1 bit sign, 7bit dec, 8 bit floating
	 //wire [3:0] i;
	 //wire delta;   //1 bit sign of E - alpha
	wire signed [15:0] x_i;
	wire signed [15:0] y_i;

	// Instantiate the Unit Under Test (UUT)
	CORDIC uut (
		.X(X), 
		.Y(Y), 
		.theta(theta), 
		.async_LD(async_LD), 
		.clk(clk),
		//.alpha_i(alpha_i),
		//.i(i),
		//.delta(delta),
		.x_i(x_i), 
		.y_i(y_i)
	);
	
	initial begin
		clk = 1;
		forever #10 clk = ~clk;
	end
	
	initial begin
		// Initialize Inputs
		//$monitor("-time:%d---| X:Y:LD = %d,%d,%b | theta:%d | output: x_i:%d, y_i:%d----aplha_i:%d |delta:%b, i:%d ",
							//$time, X, Y, async_LD, theta,  x_i, y_i, alpha_i, delta, i);
		$monitor("-time:%d---| X:Y:LD = %d,%d,%b | theta:%d | output: x_i:%d, y_i:%d",
							$time, X, Y, async_LD, theta,  x_i, y_i);

		//Scaling factor = 1/(product of all cos(theta)s = 1.64676
		X = 16'd155;   //1/(1.6)    s *2^8
		Y = 16'd0;
		theta = 16'd11520;  // theta = 45.000000
		async_LD = 1;
		
		//result should be (1/root(2), 1/root(2)) -- which is (181,181), we get (180,180)


		// Wait 100 ns for global reset to finish
		#100;
		async_LD = 0;
        
		// Add stimulus here
		#300;
		//need terminal count to freeze
		$finish;

	end
      
endmodule

