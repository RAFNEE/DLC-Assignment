`timescale 1ns/100ps

module tb_fa;
	reg a, b, ci;
	wire co, s;
	
	fa tb_fa0(a, b, ci, co, s);
	
	initial begin
	
	// 8 cases testbench for 3 inputs
	#0	a = 1'b0; b = 1'b0; ci = 1'b0;
	#10 a = 1'b0; b = 1'b1; ci = 1'b0;
	
	#10 a = 1'b0; b = 1'b0; ci = 1'b1;
	#10 a = 1'b0; b = 1'b1; ci = 1'b1;
	
	#10 a = 1'b1; b = 1'b0; ci = 1'b0;
	#10 a = 1'b1; b = 1'b1; ci = 1'b0;
	
	#10 a = 1'b1; b = 1'b0; ci = 1'b1;
	#10 a = 1'b1; b = 1'b1; ci = 1'b1;
	
	#10 $finish;		//end testbench
	
	end
	
endmodule
