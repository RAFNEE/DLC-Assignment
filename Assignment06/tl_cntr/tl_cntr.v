module tl_cntr (clk, reset_n, Ta, Tb, La, Lb);
	input clk, reset_n, Ta, Tb;
	output [1:0] La, Lb;
	reg [1:0] La, Lb;
	
	// encoded states
	parameter S0 = 2'b00;
	parameter S1 = 2'b01;
	parameter S2 = 2'b10;
	parameter S3 = 2'b11;
	
	// encoded traffic colors
	parameter GREEN = 2'b00;
	parameter YELLOW = 2'b01;
	parameter RED = 2'b10;
	
	// sequential circuit for states
	reg [1:0] state;
	reg [1:0] next_state;
	
	// condition of clk or reset
	always @ (posedge clk or negedge reset_n) begin
	
	if (reset_n == 1'b0)
		state <= S0;
	else
		state <= next_state;
	end
	
	// combinational circuit
	// state transition condition with Ta, Tb
	always @ (state or Ta or Tb) begin
	
	// output next state by state, Ta and Tb
	casex ({state, Ta, Tb})
	
	{S0, 1'b0, 1'bx}: next_state <= S1;		// Ta'
	{S0, 1'b1, 1'bx}: next_state <= S0;		// Ta
	
	{S1, 1'bx, 1'bx}: next_state <= S2;		// don't care
	
	{S2, 1'bx, 1'b0}: next_state <= S3;		// Tb'
	{S2, 1'bx, 1'b1}: next_state <= S2;		// Tb
	
	{S3, 1'bx, 1'bx}: next_state <= S0;		// don't care
	
	default: next_state <= 2'bx;
	
	endcase
	
	end
	
	// generate state output
	always @ (state) begin
	
	// store La and Lb with traffic colors by state
	casex (state)
	S0: begin La = GREEN; Lb = RED; end
	S1: begin La = YELLOW; Lb = RED; end
	S2: begin La = RED; Lb = GREEN; end
	S3: begin La = RED; Lb = YELLOW; end
	default: next_state <= 2'bx;
	
	endcase
	
	end
	
endmodule
