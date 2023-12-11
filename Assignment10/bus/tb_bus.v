`timescale 1ns/100ps

module tb_bus;
	reg clk, reset_n, m0_req, m0_wr, m1_req, m1_wr;
	reg [7:0] m0_address, m1_address;
	reg [31:0] m0_dout, m1_dout, s0_dout, s1_dout;
	wire m0_grant, m1_grant, s0_sel, s1_sel, s_wr;
	wire [7:0] s_address;
	wire [31:0] m_din, s_din;
	
	bus Unit_bus(.clk(clk), .reset_n(reset_n), .m0_req(m0_req), .m0_wr(m0_wr), .m0_address(m0_address), .m0_dout(m0_dout), .m1_req(m1_req), .m1_wr(m1_wr), .m1_address(m1_address), .m1_dout(m1_dout), .s0_dout(s0_dout), .s1_dout(s1_dout), .m0_grant(m0_grant), .m1_grant(m1_grant), .m_din(m_din), .s0_sel(s0_sel), .s1_sel(s1_sel), .s_address(s_address), .s_wr(s_wr), .s_din(s_din));
	
	always begin
	
	#5; clk = ~clk;		// generate clock
	
	end
	
	initial begin
	
	// initialize signals
	clk = 0; reset_n = 0; m0_req = 0; m0_wr = 0; m1_req = 0; m1_wr = 0;
	m0_address = 8'b0; m1_address = 8'b0;
	m0_dout = 32'b0; m1_dout = 32'b0; s0_dout = 32'b0; s1_dout = 32'b0;
	
	// test 1 : in M0 state and correct address
	#10; reset_n = 1; m0_req = 1; m0_address = 8'h01; m0_wr = 1; m0_dout = 32'h12345678; s0_dout = 32'h98765432;
	#10; m0_address = 8'h02;
	#10; m0_address = 8'h03;
	#10; m0_address = 8'h04;
	
	// test 2 : in M1 state and correct address
	#10; m0_req = 0; m1_req = 1; m1_address = 8'h21; m1_wr = 1; m1_dout = 32'hAABBCCDD; s1_dout = 32'hFFFF1111;
	#10; m1_address = 8'h22;
	#10; m1_address = 8'h23;
	#10; m1_address = 8'h24;
	
	// check read
	#10; m0_req = 1; m0_address = 8'h01; m0_wr = 0;
	#10; m0_address = 8'h02;
	#10; m0_address = 8'h03;
	#10; m0_address = 8'h04;
	
	// check read
	#10; m0_req = 0; m1_req = 1; m1_address = 8'h21; m1_wr = 0;
	#10; m1_address = 8'h22;
	#10; m1_address = 8'h23;
	#10; m1_address = 8'h24;
	
	// test 3 : in M0 state and wrong address
	#10; m0_req = 1; m1_req = 0; m0_address = 8'h11; m0_wr = 1; m0_dout = 32'hAAAABBBB; s0_dout = 32'h12345678;
	#10; m0_wr = 0;
	#10; m0_wr = 1; m0_address = 8'h42;
	
	// finish the simulation
	#10; $finish;
	
	end
	
endmodule
