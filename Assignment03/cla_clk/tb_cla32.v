`timescale 1ns/100ps
	
module tb_cla32;
	reg [31:0] tb_a, tb_b; 
	reg tb_ci;
	
	wire [31:0] tb_s;
	wire tb_co;
	
	// instance the cla32 module
	cla32 Unit_cla32(.a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s), .co(tb_co));
	
	initial begin
	
	// initialize testbench inputs
	#0; tb_a = 32'h00000000; tb_b = 32'h00000000; tb_ci = 1'b0;
	
	// check adding values
	#10; tb_a = 32'h00000101; tb_b = 32'h10000002; tb_ci = 1'b0;
	#10; tb_a = 32'h7FFFFFFF; tb_b = 32'h00000001; tb_ci = 1'b0;
	#10; tb_a = 32'h1203EADB; tb_b = 32'h53183CF2; tb_ci = 1'b0;
	#10; tb_a = 32'h7FFFFFFF; tb_b = 32'h7FFFFFFF; tb_ci = 1'b0;
	
	// check carry-out is correct
	#10; tb_a = 32'hFFFFFFFE; tb_b = 32'hFFFFFFFD; tb_ci = 1'b0;
	
	// check carry-in
	#10; tb_a = 32'hF1040701; tb_b = 32'h0E050109; tb_ci = 1'b1;
	
	// check carry-out is correct
	#10; tb_a = 32'h7FFFFFFF; tb_b = 32'h7FFFFFFF; tb_ci = 1'b1;
	#10; tb_a = 32'hFFFFFFFF; tb_b = 32'hFFFFFFFF; tb_ci = 1'b1;
	#10; $finish;

	end
	
endmodule
