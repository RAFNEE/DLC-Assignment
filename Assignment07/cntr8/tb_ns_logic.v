`timescale 1ns/100ps

module tb_ns_logic;
	reg load, inc;
	reg [2:0] state;
	wire [2:0] next_state;

	ns_logic Unit_ns_logic(.load(load), .inc(inc), .state(state), .next_state(next_state));

	initial begin
	
	// initialize signals
	state = 3'b000;
	load = 1'b1;
	inc = 1'b0;
	
	// change state
	#2; state = 3'b001;
	#2; state = 3'b010;
	#2; state = 3'b011;
	#2; state = 3'b100;
	#2; state = 3'b101;
	
	// test
	#2; load = 1'b0; state = 3'b000; inc = 1'b1;
	#2; inc = 1'b0;
	
	#2; state = 3'b001; inc = 1'b1;
	#2; inc = 1'b0;
	
	#2; state = 3'b010; inc = 1'b1;
	#2; inc = 1'b0;
	
	#2; state = 3'b011; inc = 1'b1;
	#2; inc = 1'b0;
	
	#2; state = 3'b100; inc = 1'b0;
	#2; inc = 1'b1;
	
	#2; state = 3'b101; inc = 1'b0;
	#2; inc = 1'b1;
	
	// finish the simulation
	#10; $finish;
	
	end

endmodule
