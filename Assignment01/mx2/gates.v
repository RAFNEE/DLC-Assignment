module _nand2(a, b, y);		// declare 2 input nand module
	input a,b;		// define 2 inputs
	output y;		// define 1 output
	
	assign y = ~(a & b);		// assign output of 2 input nand gate
	
endmodule
	
module _inv(a, y);		// declare inverter module
	input a;		// define 1 input
	output y;		// define 1 output to save inverted input
	
	assign y = ~a;		// inverting input
	
endmodule
