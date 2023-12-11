`timescale 1ns/100ps

module tb_ha;
	reg a, b;
	wire co, s;
	
	ha tb_ha0(a, b, co, s);
	
	initial begin
	
	// 4 cases testbench for 2 inputs
	#0	a = 1'b0; b = 1'b0;
	#10 a = 1'b0; b = 1'b1;
	
	#10 a = 1'b1; b = 1'b0;
	#10 a = 1'b1; b = 1'b1;
	
	#10 $finish;		//end testbench
	
	end
	
endmodule
