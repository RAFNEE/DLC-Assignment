module cc_logic(op, shamt, d_in, d_out, do_next);
	input [2:0] op; 
	input [1:0] shamt;
	input [7:0] d_in;
	input [7:0] d_out;
	output [7:0] do_next;
	
	reg [7:0] do_next;

	wire [7:0] d_LSL;
	wire [7:0] d_LSR;
	wire [7:0] d_ASR;
	
	// instance operation code
	parameter NOP = 3'b000;
	parameter LOAD = 3'b001;
	parameter LSL = 3'b010;
	parameter LSR = 3'b011;
	parameter ASR = 3'b100;

	always @ (op, shamt, d_in, d_out, d_LSL, d_LSR, d_ASR) begin
		
		// select do_next with each input by opcode
		case(op)
		
		NOP: begin do_next = d_out; end
		LOAD: begin do_next = d_in; end
		LSL: begin do_next = d_LSL; end
		LSR: begin do_next = d_LSR; end
		ASR: begin do_next = d_ASR; end
		
		endcase
		
	end
	
	// calculate shift operation and store in each wire
	LSL8 U0_LSL8(.d_in(d_out), .shamt(shamt), .d_out(d_LSL));
	LSR8 U1_LSR8(.d_in(d_out), .shamt(shamt), .d_out(d_LSR));
	ASR8 U2_ASR8(.d_in(d_out), .shamt(shamt), .d_out(d_ASR));

endmodule
