`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:01:05 05/09/2020
// Design Name:   register
// Module Name:   C:/Users/pravnall/Documents/xilinx projects/test/register_test.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module register_test;

	// Inputs
	reg [3:0] in;
	reg [3:0] N;
	reg async_LD;
	reg clk;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	register uut (
		.in(in), 
		.N(N), 
		.async_LD(async_LD), 
		.clk(clk), 
		.out(out)
	);
	initial begin
		clk = 1;
		forever #10 clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		in = 0;
		N = 10;
		async_LD = 1;

		// Wait 100 ns for global reset to finish
		#60;
		$monitor( "%d ns: LD |N: %b| %d -- in:%d --- out:%d",
                                             $time, async_LD, N, in,out);

        
		// Add stimulus here
		async_LD = 0;
		in = 10; #20;
		in = 15; #20;
		in = 11; #20;
		in = 12; #20;

	end
      
endmodule

