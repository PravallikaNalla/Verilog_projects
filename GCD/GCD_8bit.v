`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Pravallika Nalla
// 
// Create Date:    23:27:13 06/05/2020 
// Design Name: 
// Module Name:    GCD_8bit 
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
module GCD_8bit(
    input [7:0] M,
    input [7:0] N,
    input clk,
    input load,
    input sync_reset,
	 //output reg [7:0] M_, N_, R,
    output [7:0] GCD,
    output reg TC
    );

	 //comb
	 reg [7:0] M_next, N_next,  min_MN, mod_M_sub_N;
	 wire cnt;
	 //seq
	 reg [7:0] M_, N_;
	 reg [2:0] R;   //counter for power of 2 in GCD
	 
	 and N1(cnt, ~M_[0], ~N_[0]); //count up R if both even
	 assign GCD = M_ << R;
	 

	 //should i keep min_MN and mod in same always? combinational read write race?
	 //can i make min_MN and mod calcualtions use the same comparator?
	 //make sure we are using only single subtractor
	 
	 always @(*)
	 begin
	 		if(M_ > N_)
			begin
				min_MN = N_;
				mod_M_sub_N = M_ - N_;
			end
			else
			begin
				min_MN = M_;
				mod_M_sub_N = N_ - M_;
			end
			
			if ((M_ == N_) || (M_ == 1) || (N_ == 1))
				TC = 1;
			else
				TC = 0;
	 end
	 
	 //combinatorial code
	 //always @(M_[0] or N_[0])
	 always @(*)
	 begin
		if(M_[0] == 0)
			M_next = M_ >> 1;
		else
		begin
			if(N_[0] == 0)
				M_next = M_;
			else
				M_next = min_MN;
		end
		
		if(N_[0] == 0)
			N_next = N_ >> 1;
		else
		begin
			if(M_[0] == 0)
				N_next = N_;
			else
				N_next = mod_M_sub_N;
		end
	 end
	 
	 //sequential code
	 always @(posedge clk)
	 begin
		if(sync_reset)
		begin
			M_ <= 0;
			N_ <= 0;
			R  <= 0;
		end
		else 
		begin
			if(load)
			begin
				M_ <= M;
				N_ <= N;
				R  <= 0;
			end
			else
			begin
				M_ <= M_next;
				N_ <= N_next;
				if(cnt)
					R <= R+1;
				else
					R <= R;
			end
		end
	 end
	 
	 

endmodule
