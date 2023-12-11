module ns_logic(load, inc, state, next_state);
	parameter IDLE_STATE = 3'b000;
	parameter LOAD_STATE = 3'b001;
	parameter INC_STATE = 3'b010;
	parameter INC2_STATE = 3'b011;
	parameter DEC_STATE = 3'b100;
	parameter DEC2_STATE = 3'b101;
	
	input load, inc;
	input [2:0] state;
	output [2:0] next_state;
	
	reg [2:0] next_state;
	
	always @ (load, inc, state) begin
	
		casex ({load ,inc, state})
			
			{1'b1, 1'bx, 3'bx}: next_state <= LOAD_STATE;		// load = 1, LOAD_STATE
			
			{1'b0, 1'b1, IDLE_STATE}: next_state <= INC_STATE;		// inc = 1, INC_STATE
			{1'b0, 1'b0, IDLE_STATE}: next_state <= DEC_STATE;		// inc = 0, DEC_STATE

			{1'b0, 1'b1, LOAD_STATE}: next_state <= INC_STATE;		// inc = 1, INC_STATE
			{1'b0, 1'b0, LOAD_STATE}: next_state <= DEC_STATE;		// inc = 0, DEC_STATE

			{1'b0, 1'b1, INC_STATE}: next_state <= INC2_STATE;		// inc = 1, INC2_STATE
			{1'b0, 1'b0, INC_STATE}: next_state <= DEC_STATE;		// inc = 0, DEC_STATE

			{1'b0, 1'b1, INC2_STATE}: next_state <= INC_STATE;		// inc = 1, INC_STATE
			{1'b0, 1'b0, INC2_STATE}: next_state <= DEC_STATE;		// inc = 0, DEC_STATE

			{1'b0, 1'b1, DEC_STATE}: next_state <= INC_STATE;		// inc = 1, INC_STATE
			{1'b0, 1'b0, DEC_STATE}: next_state <= DEC2_STATE;		// inc = 0, DEC2_STATE

			{1'b0, 1'b1, DEC2_STATE}: next_state <= INC_STATE;		// inc = 1, INC_STATE
			{1'b0, 1'b0, DEC2_STATE}: next_state <= DEC_STATE;		// inc = 0, DEC_STATE

			default: next_state <= 3'bx;		// set don't care
		
		endcase
	
	end
	

endmodule
