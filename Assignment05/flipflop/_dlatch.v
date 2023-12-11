module _dlatch(clk, d, q, q_bar);
	input clk;
	input d;
	output q, q_bar;
	reg q;

	always @(clk or d) begin
		if(clk == 1)		// when clk is on
			q <= d;		// insert non-blocking value
		end
	assign q_bar = ~q;		// assign not q
	
endmodule
