`timescale 1ns/100ps

module tb_rca_clk;
	reg clk, tb_ci;
	reg [31:0] tb_a, tb_b; 
	
	wire [31:0] tb_s;
	wire tb_co;
	
	parameter STEP = 10;
	
	rca_clk Unit_rca_clk(.clk(clk), .a(tb_a), .b(tb_b), .ci(tb_ci), .co(tb_co), .s(tb_s));
	
	always #(STEP/2) clk = ~clk;
	
	initial begin
	
	#0; clk = 1'b1; tb_a = 32'h00000000; tb_b = 32'h00000000; tb_ci = 1'b0;
	
	#(STEP); tb_a = 32'h63f2187a; tb_b = 32'h1d49c2e7; tb_ci = 1'b0;
	#(STEP); tb_a = 32'h9a3e2b1c; tb_b = 32'hf7dc8456; tb_ci = 1'b0;
	#(STEP); tb_a = 32'h135fa562; tb_b = 32'h35614642; tb_ci = 1'b0;
	// check sum is correct
	#(STEP); tb_a = 32'hf0f0f0f0; tb_b = 32'h0f0f0f0f; tb_ci = 1'b0;
	#(STEP); tb_a = 32'h0000ffff; tb_b = 32'hffff0000; tb_ci = 1'b0;
	
	// check carry in
	#(STEP); tb_a = 32'hbc8f72e1; tb_b = 32'h15a694fd; tb_ci = 1'b1;
	// check carry out is correct
	#(STEP); tb_a = 32'hffffffff; tb_b = 32'h00000000; tb_ci = 1'b1;
	
	#(STEP*2); $finish;

	end

endmodule
