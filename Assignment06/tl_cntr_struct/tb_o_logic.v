`timescale 1ns/100ps

module tb_o_logic;
	reg [1:0] state;
	wire [1:0] La, Lb;
	
	o_logic Unit_o_logic(.state(state), .La(La), .Lb(Lb));
	
	initial begin
	
	// initialize signals
	state = 2'b00;
	
	#10; state = 2'b01;
	#10; state = 2'b10;
	#10; state = 2'b11;
	#10; state = 2'b00;
	
	#10; $finish;
	
	end
	
endmodule
