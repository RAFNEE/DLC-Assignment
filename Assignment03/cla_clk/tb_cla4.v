`timescale 1ns/100ps

module tb_cla4;
	reg [3:0] tb_a, tb_b; 
	reg tb_ci;
	
	wire [3:0] tb_s;
	wire tb_co;
	
	cla4 Unit_cla4(.a(tb_a), .b(tb_b), .ci(tb_ci), .co(tb_co), .s(tb_s));
	
	initial begin
	
	// initialize testbench inputs
	#0; tb_a = 4'b0; tb_b = 4'b0; tb_ci = 1'b0;
	
	// check adding values
	#10; tb_a = 4'b0001; tb_b = 4'b0010; tb_ci = 1'b0;
	#10; tb_a = 4'b1110; tb_b = 4'b0001; tb_ci = 1'b0;
	#10; tb_a = 4'b0101; tb_b = 4'b1000; tb_ci = 1'b0;
	// check carry out is correct
	#10; tb_a = 4'b1111; tb_b = 4'b1111; tb_ci = 1'b0;
	
	// check carry in
	#10; tb_a = 4'b0110; tb_b = 4'b0101; tb_ci = 1'b1;
	//	check carry out is correct
	#10; tb_a = 4'b0111; tb_b = 4'b1000; tb_ci = 1'b1;
	#10; tb_a = 4'b1100; tb_b = 4'b1010; tb_ci = 1'b1;
	#10; $finish;
	
	end
	
endmodule
