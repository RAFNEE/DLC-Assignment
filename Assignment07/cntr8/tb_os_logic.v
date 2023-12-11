`timescale 1ns/100ps

module tb_os_logic;
	reg [2:0] state;
	reg [7:0] d_in;
	wire [7:0] d_out;

	os_logic Unit_os_logic(.state(state), .d_in(d_in), .d_out(d_out));
	
	initial begin
	
	// Initialize signals
	state = 3'b000;		// start in IDLE_STATE
	d_in = 8'h00;

	// test
	#10; d_in = 8'hab;
	#10; state = 3'b001;		// load d_in
	#10; state = 3'b010;		// add for INC_STATE
	#10; state = 3'b011;		// add for INC2_STATE
	#10; state = 3'b100;		// subtract for DEC_STATE
	#10; state = 3'b101;		// subtract for DEC2_STATE
	#10; state = 3'b000;		// IDLE_STATE
	#10; d_in = 8'hf8;		// change d_in
	#10; state = 3'b010;
	
	// finish the simulation
	#10; $finish;
	
	end

endmodule
