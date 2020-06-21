`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:46:42 06/19/2020 
// Design Name: 
// Module Name:    Vending_machine 
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
module Vending_machine(
    input [1:0] coin_in,
    input choose,
    input [1:0] can_choice,
    input clk,
    input sync_reset,
	 //output reg VM_state,
	 //output reg [1:0] state,
	 //output reg eject, ejectVM,
    output reg [1:0] can_out,
    output eject_out
    );
	 
	 //coin collector states - state
	 parameter [1:0] S0 = 2'b00;
	 parameter [1:0] S5 = 2'b01;
	 parameter [1:0] S10 = 2'b10;
	 parameter [1:0] S15 = 2'b11;
	 //Vending Machine states - VM_state
	 parameter READY = 0;
	 parameter CHOOSE = 1;
	 
	 reg VM_state;
	 reg [1:0] state;          	//flip flops to store states
	 reg [1:0] next_state, next_VM_state;  //COMB logic for next states
	 	 
	 wire CC_ON;
	 reg CC_rst;
	 reg eject, ejectVM;
	 or O1(eject_out, eject, ejectVM);
	 assign CC_ON = ~VM_state;  //Coin collector ON only if VM in READY state

	reg [1:0] coin;
	//register the i/ps
	always @(posedge clk)
	begin
		if (sync_reset)
			coin <= 2'b00;
		else
			coin <= coin_in;
	end
	
	//VM_state next - COMB
	always @(*)
	begin
		case(VM_state)
			READY:
			begin
				if (choose) begin
					next_VM_state = CHOOSE;
					can_out = 0;
					ejectVM = 0;
					CC_rst = 0;
				end
				else begin
					next_VM_state = READY;
					can_out = 0;
					ejectVM = 0;
					CC_rst = 0;
				end
			end
			CHOOSE:
			begin
				if (can_choice) begin
					next_VM_state = READY;
					CC_rst = 1;
					if (can_choice == state) begin
						can_out = can_choice;
						ejectVM = 0;
					end
					else begin
						can_out = 0;
						ejectVM = 1;
					end
				end
				else begin
					next_VM_state = CHOOSE;
					can_out = 0;
					ejectVM = 0;
					CC_rst = 0;
				end
			end
		endcase
	end

	//coin collector next state - COMB
	//will run only when CC_ON = 1
	always @(*)
	begin
		if ((CC_ON == 1'b0) || (CC_rst == 1'b1)) begin
			eject <= 0;
			next_state = S0;
		end
		else begin
			case(state)
			S0:
			begin
				if (coin == 2'b00) begin
					next_state = S0;
					eject <= 0;
				end
				else if (coin == 2'b01) begin
					next_state = S5;
					eject <= 0;
				end
				else if (coin == 2'b10) begin
					next_state = S10;
					eject <= 0;
				end
				else begin
					//shouldnt happen
					next_state = S0;
					eject <= 1;
				end
			end
			S5:
			begin
				if (coin == 2'b00) begin
					next_state = S5;
					eject <= 0;
				end
				else if (coin == 2'b01) begin
					next_state = S10;
					eject <= 0;
				end
				else if (coin == 2'b10) begin
					next_state = S15;
					eject <= 0;
				end
				else begin
					//shouldnt happen
					next_state = S0;
					eject <= 1;
				end
			end
			S10:
			begin
				if (coin == 2'b00) begin
					next_state = S10;
					eject <= 0;
				end
				else if (coin == 2'b01) begin
					next_state = S15;
					eject <= 0;
				end
				else begin
					//shouldnt happen
					next_state = S0;
					eject <= 1;
				end
			end
			S15:
			begin
				if (coin == 2'b00) begin
					next_state = S15;
					eject <= 0;
				end
				else begin
					next_state = S0;
					eject <= 1;
				end
			end
			default:
			begin
				next_state = S0;
				eject <= 0;
			end
			endcase
		end
	 end

	 
	 //seq - FSM
	 always @(posedge clk)
	 begin
		if (sync_reset) begin
			state <= S0;
			VM_state <= READY;
		end
		else begin
			state <= next_state;
			VM_state <= next_VM_state;
		end
	 end

endmodule
