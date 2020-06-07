`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:09:21 06/06/2020
// Design Name:   GCD_8bit
// Module Name:   C:/Users/pravnall/Documents/xilinx projects/RTL_projects/GCD_8bit_test.v
// Project Name:  RTL_projects
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GCD_8bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module GCD_8bit_test;

	// Inputs
	reg [7:0] M;
	reg [7:0] N;
	reg clk;
	reg load;
	reg sync_reset;

	// Outputs
	//wire [7:0] M_, N_, R;
	wire [7:0] GCD;
	wire TC;

	// Instantiate the Unit Under Test (UUT)
	GCD_8bit uut (
		.M(M), 
		.N(N), 
		.clk(clk), 
		.load(load), 
		.sync_reset(sync_reset), 
		//.M_(M_),
		//.N_(N_),
		//.R(R),
		.GCD(GCD), 
		.TC(TC)
	);

	initial begin
		clk = 1;
		forever #10 clk = ~clk;
	end

	initial begin
		$monitor("load:%b, res:%b, M %d N %d, TC:%b, GCD:%d", load, sync_reset, M, N, TC, GCD);
		//$monitor("load:%b, res:%b, M %d N %d, TC:%b, GCD:%d .... M_:%d, N_:%d, R:%d", load, sync_reset, M, N, TC, GCD, M_, N_, R);
		// Initialize Inputs
		M = 0;
		N = 0;
		load = 0;
		sync_reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		M = 10;
		N = 20;
		load = 1;
		sync_reset = 0;
        
		// Add stimulus here
		#20;
		load = 0;
		#60;
		M = 10;
		N = 22;
		load = 1;
		#20;
		load = 0;
		#160;
		M = 36;
		N = 60;
		load = 1;
		#20;
		load = 0;
		#240;

		$finish;

	end
      
endmodule

