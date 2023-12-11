module rca_clk(clk, a, b, ci, co, s);
	input clk, ci;
	input [31:0] a,b;
	output [31:0] s;
	output co;
	
	reg reg_ci;
	reg [31:0] reg_a, reg_b;
	
	reg reg_co;
	reg [31:0] reg_s;
	
	wire wire_co;
	wire [31:0] wire_s;
	
	// RCA with registers on posedge
	always @ (posedge clk)
	
	begin 
	
	// copy each I/O to reg
	reg_a <= a;
	reg_b <= b;
	reg_ci <= ci;
	
	reg_s <= wire_s;
	reg_co <= wire_co;
	
	end
	
	// instance 32-bit RCA
	rca32 Unit_rca32(.a(reg_a), .b(reg_b), .ci(reg_ci), .co(wire_co), .s(wire_s));
	
	// assign each reg to output
	assign s = reg_s;
	assign co = reg_co;
	
endmodule
