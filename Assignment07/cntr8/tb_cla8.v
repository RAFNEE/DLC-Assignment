`timescale 1ns/100ps

module tb_cla8;
	reg [7:0] a, b; 
	reg ci;
	
	wire [7:0] s;
	wire co;
	
	cla8 Unit_cla8(.a(a), .b(b), .ci(ci), .co(co), .s(s));
	
	initial begin
	
	// initialize testbench inputs
	#0; a = 8'b00000000; b = 8'b00000000; ci = 1'b0;
	
	// check adding values
	#10; a = 8'b10101001; b = 8'b01010010; ci = 1'b0;
	#10; a = 8'b11001110; b = 8'b00110001; ci = 1'b0;
	#10; a = 8'b01001101; b = 8'b10001000; ci = 1'b0;
	// check carry out is correct
	#10; a = 8'b10001111; b = 8'b10001111; ci = 1'b0;
	
	// check carry in
	#10; a = 8'b00000110; b = 8'b00000101; ci = 1'b1;
	//	check carry out is correct
	#10; a = 8'b11000111; b = 8'b01001000; ci = 1'b1;
	#10; a = 8'b10001100; b = 8'b10111010; ci = 1'b1;
	#10; $finish;
	
	end
	
endmodule
