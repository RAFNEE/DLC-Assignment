`timescale 1ns/100ps

module tb_ASR8;
	reg [7:0] d_in;
	reg [1:0] shamt;
	wire [7:0] d_out;
	
	ASR8 Unit_ASR8(.d_in(d_in), .shamt(shamt), .d_out(d_out));

	initial begin
	
	// initialize signals
	d_in = 8'b10101010; shamt = 2'b00;

	#10; shamt = 2'b01;		// shift right 1 bit, 11010101
	#10; shamt = 2'b10;		// shift right 2 bit, 11110101
		
	#5; d_in = 8'b00011000; shamt = 2'b11;		// shift right 3 bit, 00000011

	// finish the simulation
	#10; $finish;
		
	end
	
endmodule
