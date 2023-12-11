`timescale 1ns/100ps

module tb_register32_8;
	reg clk, reset_n;
	reg [7:0] en;
	reg [31:0] d_in;
	
	wire [31:0] d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7;
	
	register32_8 Unit_reg32_8(.clk(clk), .reset_n(reset_n), .en(en), .d_in(d_in), .d_out0(d_out0), .d_out1(d_out1), .d_out2(d_out2), .d_out3(d_out3), .d_out4(d_out4), .d_out5(d_out5), .d_out6(d_out6), .d_out7(d_out7));
	
	always begin
	
	#2; clk = ~clk;		// generate clock
	
	end
	
	initial begin
	
	// initialize signals
	clk = 0; reset_n = 0; en = 8'hx; d_in = 32'hx;
	
	#5; en = 8'b00000001;
	#4; reset_n = 1; d_in = 32'h00ff00ff;
	
	#5; en = 8'b00000010;
	#5; en = 8'b00000100;
	#5; en = 8'b00001000;
	#5; en = 8'b00010000;
	#5; en = 8'b00100000;
	#5; en = 8'b01000000;
	#5; en = 8'b10000000;
	
	#10; $finish;
	
	end
	
endmodule
