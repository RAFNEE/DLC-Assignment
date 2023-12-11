module _dff_r_async(clk, reset_n, d, q);
	input clk, reset_n, d;
	output q;
	reg q;
	
	// when clock is posedge or reset_n is negedge
	always @(posedge clk or negedge reset_n) begin
	if(reset_n == 0)		// when reset_n is 0
		q <= 1'b0;		// q must be 0
	else
		q <= d;		// q is d with non-blocking
		
	end

endmodule
