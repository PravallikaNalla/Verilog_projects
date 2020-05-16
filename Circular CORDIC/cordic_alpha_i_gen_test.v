`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:47:06 05/16/2020
// Design Name:   cordic_alpha_i_gen
// Module Name:   C:/Users/pravnall/Documents/xilinx projects/test/cordic_alpha_i_gen_test.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cordic_alpha_i_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cordic_alpha_i_gen_test;

	// Inputs
	reg [3:0] i;

	// Outputs
	wire [15:0] alpha_i;

	// Instantiate the Unit Under Test (UUT)
	cordic_alpha_i_gen uut (
		.i(i),
		.alpha_i(alpha_i)
	);
	
	initial begin
		// Initialize Inputs
		i = 0;
		$monitor("time:%d  i:%d  alpha_i:%d",$time,i,alpha_i);
		
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		i=1; #20;
		i=2; #20;
		i=3; #20;
		i=4; #20;
		i=5; #20;
		i=6; #20;
		i=7; #20;
		i=8; #20;
		i=9; #20;
		i=10; #20;
		i=11; #20;
		i=12; #20;
		i=13; #20;
		i=14; #20;
		i=15; #20;
		$finish;


	end
      
endmodule

