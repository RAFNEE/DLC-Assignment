module cal_flags32(op, result, co_add, co_prev_add, c, n, z, v);
	input [2:0] op;		// 3-bit operation code
	input [31:0] result;		// 4-bit ALU result
	input co_add, co_prev_add;
	
	output c, n, z, v;
	
	// assign each output
	assign c = (op[2:1] != 2'b11) ? 1'b0 : co_add;		// carry // conditional operator
	assign n = result[31];		// negative
	assign z = (result == 32'b0) ? 1'b1 : 1'b0;		// zero  // conditional operator
	assign v = (op[2:1] != 2'b11) ? 1'b0 : co_add ^ co_prev_add;		// overflow // conditional operator
	
endmodule
