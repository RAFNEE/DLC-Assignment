module _dff_r_sync_async(clk, reset_n, d, q_sync, q_async);
	input clk, reset_n, d;
	output q_sync, q_async;
	wire q_sync_reg, q_async_reg;
	
	// instance dff sync / dff async
	_dff_r_sync Unit_dff_r_sync(.clk(clk), .reset_n(reset_n), .d(d), .q(q_sync_reg));
	_dff_r_async Unit_dff_r_async(.clk(clk), .reset_n(reset_n), .d(d), .q(q_async_reg));
	
	// assign q values
	assign q_sync = q_sync_reg;
	assign q_async = q_async_reg;

endmodule
