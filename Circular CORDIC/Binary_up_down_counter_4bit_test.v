`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:02:54 05/01/2020
// Design Name:   Binar_up_down_counter_4bit
// Module Name:   C:/Users/pravnall/Documents/xilinx projects/test/Binary_up_down_counter_4bit_test.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Binar_up_down_counter_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Binary_up_down_counter_4bit_test;

	// Inputs
	reg sync_reset;
	reg load;
	reg count;
	reg up_down;
	reg clk;
	reg [3:0] N;

	// Outputs
	wire [3:0] O;

	// Instantiate the Unit Under Test (UUT)
	Binary_up_down_counter uut (
		.sync_reset(sync_reset), 
		.load(load), 
		.count(count), 
		.up_down(up_down), 
		.clk(clk), 
		.N(N), 
		.O(O)
	);

	initial begin
		clk = 1;
		forever #10 clk = ~clk;
	end
	initial begin
		// Initialize Inputs
		sync_reset = 1;
		load = 0;
		count = 0;
		up_down = 0;
		N = 0;

		// Wait 100 ns for global reset to finish
		#40;
		sync_reset = 0;
		
		$monitor( "%d ns: Load: %b| count:%b| up_down: %b | N: %d | output: %d",
                                           $time, load, count, up_down, N, O);
		// Add stimulus here
		N = 5; load = 1; #20;
		#20;
		N = 9; load = 0; count = 1; #20;
		#80;
		N = 9; load = 1; #20;
		N = 9; load = 0; count = 1; up_down = 1; #20;
		#100;
		$finish;

	end
      
endmodule

