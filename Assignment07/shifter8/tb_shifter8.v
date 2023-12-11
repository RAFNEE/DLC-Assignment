`timescale 1ns/100ps

module tb_shifter8;
	reg clk, reset_n;
	reg [2:0] op;
	reg [1:0] shamt;
	reg [7:0] d_in;
	wire [7:0] d_out;
	
	shifter8 Unit_shifter8(.clk(clk), .reset_n(reset_n), .op(op), .shamt(shamt), .d_in(d_in), .d_out(d_out));
	
	always begin
	
	#5; clk = ~clk;		// generate clock
	
	end
	
	initial begin
	
	// initialize signals
	clk = 0; reset_n = 0; op = 3'b000; shamt = 2'b00; d_in = 8'b00000000;
	
	#13; reset_n = 1; op = 3'b001; d_in = 8'b00110100;
	#9; op = 3'b010;
	#4; shamt = 2'b01;
	#10; op = 3'b011;
	
	#14; op = 3'b010; shamt = 2'b11;
	#16; op = 3'b001; d_in = 8'b10011000;
	#17; op = 3'b100; shamt = 2'b01;
	#10; shamt = 2'b11;
	
	#10; $finish;
	
	end
	
endmodule
