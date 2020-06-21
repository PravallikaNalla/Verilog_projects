`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:55:28 06/19/2020
// Design Name:   Vending_machine
// Module Name:   C:/Users/pravnall/Documents/xilinx projects/RTL_projects/Vending_machine_test.v
// Project Name:  RTL_projects
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Vending_machine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Vending_machine_test;

	// Inputs
	reg [1:0] coin;
	reg choose;
	reg [1:0] can_choice;
	reg clk;
	reg sync_reset;

	// Outputs
	//wire VM_state;
	//wire [1:0] state;
	//wire eject, ejectVM;
	wire [1:0] can_out;
	wire eject_out;

	// Instantiate the Unit Under Test (UUT)
	Vending_machine uut (
		.coin_in(coin), 
		.choose(choose), 
		.can_choice(can_choice), 
		.clk(clk), 
		.sync_reset(sync_reset), 
		//.VM_state(VM_state),
		//.state(state),
		//.eject(eject),
		//.ejectVM(ejectVM),
		.can_out(can_out), 
		.eject_out(eject_out)
	);

	initial begin
		clk = 1;
		forever #10 clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		coin = 0;
		choose = 0;
		can_choice = 0;
		sync_reset = 1;
		$monitor("time %d- coin_in:%d can_choice:%d choose:%b RST:%b -- can_out:%d eject:%b", $time, coin, can_choice, choose, sync_reset, can_out, eject_out);
		//$monitor("time %d- coin_in:%d can_choice:%d choose:%b RST:%b -- VM_state:%b state:%d-- can_out:%d eject:%b | eject %b,VMej %b ", $time, coin, can_choice, choose, sync_reset, VM_state, state, can_out, eject_out, eject, ejectVM);

		// Wait 100 ns for global reset to finish
		#80;
		sync_reset = 0;

		// Add stimulus here
		#20;
		coin = 1;
		#20;
		coin = 0;
		choose = 1;
		can_choice = 1;
		#40;
		$display("now can 2");
		coin = 2;
		choose = 0;
		#20;
		coin = 0;
		choose = 1;
		can_choice = 1;
		#40;
		$display("now can 2 --");
		coin = 2;
		choose = 0;
		#20;
		coin = 0;
		#20;
		coin = 0;
		choose = 1;
		can_choice = 2;

		#40;
		$display("now can 3");
		coin = 1;
		choose = 0;
		#20;
		coin = 2;
		#20;
		coin = 0;
		choose = 1;
		can_choice = 3;
		#40;
		$display("now can 3");
		coin = 2;
		choose = 0;
		#20;
		coin = 1;
		#20;
		coin = 0;
		choose = 1;
		can_choice = 2;
		#40;
		
		$display("testing eject for excess coins");
		coin = 2;
		choose = 0;
		#20;
		coin = 2;
		#20;
		coin = 2;
		#20;
		coin = 1;
		#20;
		coin = 2;
		#20;
		coin = 1;
		#20;
		coin = 0;
		#20;
		coin = 1;
		#20;
		coin = 1;
		#20;
		coin = 2;
		#20;
		$display("now can 3");
		coin = 1;
		#20;
		coin = 1;
		#20;
		coin = 1;

		#20;
		coin = 0;
		choose = 1;
		can_choice = 3;
		#40
		$finish;

	end
      
endmodule

