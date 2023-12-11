`timescale 1ns/100ps

module tb_o_logic;
	reg [2:0] state;
	wire [1:0] La, Lb;
	
	o_logic Unit_o_logic(.state(state), .La(La), .Lb(Lb));
	
	initial begin
	
	// initialize signals
	state = 3'b000;
	
	// test
	#10; state = 3'b001;
	#10; state = 3'b010;
	#10; state = 3'b011;
	#10; state = 3'b100;
	#10; state = 3'b101;
	#10; state = 3'b110;
	#10; state = 3'b111;
	#10; state = 3'b000;
	
	#10; $finish;
	
	end
	
endmodule
