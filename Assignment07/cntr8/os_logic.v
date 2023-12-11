module os_logic(state, d_in, d_out);
	parameter IDLE_STATE = 3'b000;
	parameter LOAD_STATE = 3'b001;
	parameter INC_STATE = 3'b010;
	parameter INC2_STATE = 3'b011;
	parameter DEC_STATE = 3'b100;
	parameter DEC2_STATE = 3'b101;
	
	input [2:0] state;
	input [7:0] d_in;
	output [7:0] d_out;
	
	reg [7:0] d_out;
	wire [7:0] d_inc, d_dec;
	
	always @(state, d_in) begin
	
		casex(state)
			
			IDLE_STATE : d_out <= 8'h00;		// reset data
			LOAD_STATE : d_out <= d_in;		// load data
			INC_STATE : d_out <= d_inc;		// add data
			INC2_STATE : d_out <= d_inc;		// add data
			DEC_STATE : d_out <= d_dec;		// subtract data
			DEC2_STATE : d_out <= d_dec;		// subtract data
			default : d_out <= d_in;
			
		endcase

	end
	
	cla8 U0_cla8(.a(d_out), .b(8'h01), .ci(1'b0), .s(d_inc));
	cla8 U1_cla8(.a(d_out), .b(8'hff), .ci(1'b0), .s(d_dec));
	
endmodule
