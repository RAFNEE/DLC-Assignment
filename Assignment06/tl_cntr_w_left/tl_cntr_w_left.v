module tl_cntr_w_left(clk, reset_n, Ta, Tal, Tb, Tbl, La, Lb);
	input clk, reset_n, Ta, Tal, Tb, Tbl;
	output [1:0] La, Lb;
	reg [1:0] La, Lb;
	
	// encoded states
	parameter S0 = 3'b000;
	parameter S1 = 3'b001;
	parameter S2 = 3'b010;
	parameter S3 = 3'b011;
	parameter S4 = 3'b100;
	parameter S5 = 3'b101;
	parameter S6 = 3'b110;
	parameter S7 = 3'b111;
	
	// encoded traffic colors
	parameter GREEN = 2'b00;
	parameter YELLOW = 2'b01;
	parameter LEFT = 2'b10;
	parameter RED = 2'b11;
	
	// sequential circuit for states
	reg [2:0] state;
	reg [2:0] next_state;
	
	// condition of clk or reset
	always @ (posedge clk or negedge reset_n) begin
	
	if (reset_n == 1'b0)
		state <= S0;
	else
		state <= next_state;
	end
	
	// combinational circuit
	// state transition condition with Ta, Tal, Tb, Tbl
	always @ (state or Ta or Tal or Tb or Tbl) begin
	
	// output next state by state, Ta and Tb
	casex ({state, Ta, Tal, Tb, Tbl})
	
	{S0, 1'b0, 1'bx, 1'bx, 1'bx}: next_state <= S1;		// Ta'
	{S0, 1'b1, 1'bx, 1'bx, 1'bx}: next_state <= S0;		// Ta
	
	{S1, 1'bx, 1'bx, 1'bx, 1'bx}: next_state <= S2;		// don't care
	
	{S2, 1'bx, 1'b0, 1'bx, 1'bx}: next_state <= S3;		// Tb'
	{S2, 1'bx, 1'b1, 1'bx, 1'bx}: next_state <= S2;		// Tb
	
	{S3, 1'bx, 1'bx, 1'bx, 1'bx}: next_state <= S4;		// don't care
	
	{S4, 1'bx, 1'bx, 1'b0, 1'bx}: next_state <= S5;		//	Tb'
	{S4, 1'bx, 1'bx, 1'b1, 1'bx}: next_state <= S4;		// Tb
	
	{S5, 1'bx, 1'bx, 1'bx, 1'bx}: next_state <= S6;		// don't care
	
	{S6, 1'bx, 1'bx, 1'bx, 1'b0}: next_state <= S7;		// Tbl'
	{S6, 1'bx, 1'bx, 1'bx, 1'b1}: next_state <= S6;		// Tbl
	
	{S7, 1'bx, 1'bx, 1'bx, 1'bx}: next_state <= S0;		// don't care
	
	default: next_state <= 3'bx;
	
	endcase
	
	end
	
	// generate state output
	always @ (state) begin
	
	// store La and Lb with traffic colors by state
	casex (state)
	S0: begin La = GREEN; Lb = RED; end
	S1: begin La = YELLOW; Lb = RED; end
	S2: begin La = LEFT; Lb = RED; end
	S3: begin La = YELLOW; Lb = RED; end
	S4: begin La = RED; Lb = GREEN; end
	S5: begin La = RED; Lb = YELLOW; end
	S6: begin La = RED; Lb = LEFT; end
	S7: begin La = RED; Lb = YELLOW; end
	default: next_state <= 3'bx;
	
	endcase
	
	end
	
endmodule
