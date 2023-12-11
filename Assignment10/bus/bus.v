module bus(clk, reset_n, m0_req, m0_wr, m0_address, m0_dout, m1_req, m1_wr, m1_address, m1_dout, s0_dout, s1_dout, m0_grant, m1_grant, m_din, s0_sel, s1_sel, s_address, s_wr, s_din);
	input clk, reset_n, m0_req, m0_wr, m1_req, m1_wr;
	input [7:0] m0_address, m1_address;
	input [31:0] m0_dout, m1_dout, s0_dout, s1_dout;
	output m0_grant, m1_grant, s0_sel, s1_sel, s_wr;
	output [7:0] s_address;
	output [31:0] m_din, s_din;
	
	wire sel;		// connect value with flip-flop
	
	// instance modules
	_dff_r Unit_dff_r(.clk(clk), .reset_n(reset_n), .d(s1_sel), .q(sel));		// using flip-flop to connect select value
	
	// instance mux to select m0 value or m1 value
	mux2 U0_mux2(.d0(m0_wr), .d1(m1_wr), .s(m1_grant), .y(s_wr));		// write value
	mux2_8bit U1_mux2_8(.d0(m0_address), .d1(m1_address), .s(m1_grant), .y(s_address));		// address
	mux2_32bit U2_mux2_32(.d0(m0_dout), .d1(m1_dout), .s(m1_grant), .y(s_din));		// m_dout to s_din
	mux3_32bit U3_mux3_32(.d0(s0_dout), .d1(s1_dout), .d2(32'h0), .s(sel), .y(m_din));		// s_dout and 0 to m_din
	
	bus_arbit Unit_arbiter(.clk(clk), .reset_n(reset_n), .m0_req(m0_req), .m1_req(m1_req), .m0_grant(m0_grant), .m1_grant(m1_grant));		// instance arbiter
	bus_addr Unit_addr_decoder(.s_address(s_address), .s0_sel(s0_sel), .s1_sel(s1_sel));		// instance address decoder
	
endmodule
