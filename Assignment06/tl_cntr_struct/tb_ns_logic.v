`timescale 1ns/100ps

module tb_ns_logic;
	reg Ta, Tb;
	reg [1:0] state;
	wire [1:0] next_state;
	
	ns_logic Unit_ns_logic(.Ta(Ta), .Tb(Tb), .state(state), .next_state(next_state));
	
	initial begin
	
	// initialize signals
	Ta = 0; Tb = 0; state = 2'b00;
	
	#10; Ta = 1;
	#4; Tb = 1; state = 2'b01;
	#6; Ta = 0; Tb = 0; state = 2'b10;
	#8; Ta = 1; Tb = 1; state = 2'b00;
	#10; Ta = 0;
	#4; Ta = 1; Tb = 0; state = 2'b11;
	#6; Ta = 0; Tb = 1; state = 2'b10;
	
	#10; $finish;
	
	end
	
endmodule
