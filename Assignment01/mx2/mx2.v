module mx2(d0, d1, s, y);		// declare 2 in 1 mux module
	input d0, d1, s;			// define 3 inputs
	output y;		// define 1 output
	wire [1:0] w;		// to save output of first and second nand2
	
	_inv iv0(s, sb);		// inverting s
	_nand2 nd20(d0, sb, w[0]);		// select sb with d0
	_nand2 nd21(d1, s, w[1]);		// select s with d0
	_nand2 nd22(w[0], w[1], y);		// assign y with w[0], w[1]
	
endmodule
