`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:24:16 05/13/2020
// Design Name:   cordic_delta_i_gen
// Module Name:   C:/Users/pravnall/Documents/xilinx projects/test/cordic_delta_i_gen_test.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cordic_delta_i_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cordic_delta_i_gen_test;

	// Inputs
	reg [15:0] theta;
	reg [15:0] alpha_i;
	reg async_LD;
	reg clk;

	// Outputs
	//wire [15:0] e_i1, e_i;
	wire delta;

	// Instantiate the Unit Under Test (UUT)
	cordic_delta_i_gen uut (
		.theta(theta), 
		.alpha_i(alpha_i), 
		.async_LD(async_LD), 
		.clk(clk),
		//.e_i1(e_i1),
		//.e_i(e_i),
		.delta(delta)
	);

	initial begin
		clk = 1;
		forever #10 clk = ~clk;
		$monitor( "%d ns: LD |theta: %b| %d -- alpha_i:%d --- delta-sign:%b",
                                             $time, async_LD, theta, alpha_i, delta);
		//$monitor( "e_i-1: %d, e_i: %d", e_i1, e_i);
	end
	
	initial begin
		// Initialize Inputs
		theta = 35;
		alpha_i = 20;
		async_LD = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
        
		// Add stimulus here
		async_LD = 0;
		theta = 40;
		alpha_i = 17;

		#20; alpha_i = 15;
		#20; alpha_i = 12;
		#20; alpha_i = 4;
		#20; alpha_i = 1;
		#20;
		$finish;
		

	end
      
endmodule
