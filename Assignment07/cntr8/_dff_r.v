module _dff_r(clk, reset_n, d, q);
	input clk, reset_n, d;
	output q;
	reg q;
	
	// when clk is 1 and reset_n is 0
	always @ (posedge clk or negedge reset_n) begin
	
		if(reset_n == 0)		// if reset is 0
			q <= 1'b0;		// q must be 0
		else
			q <= d;		// q = d by non-blocking
		
	end
	
endmodule
