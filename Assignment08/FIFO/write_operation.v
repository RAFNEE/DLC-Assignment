module write_operation(Addr, we, to_reg);
	input we;
	input [2:0] Addr;
	output [7:0] to_reg;
	wire [7:0] w_a;
	
	// instance decoder
	_3_to_8_decoder Unit_3_to_8_decoder(.d(Addr), .q(w_a));
	
	// instance 2 to 1 and gates
	_and2 U0_and2(.a(we), .b(w_a[0]), .y(to_reg[0]));
	_and2 U1_and2(.a(we), .b(w_a[1]), .y(to_reg[1]));
	_and2 U2_and2(.a(we), .b(w_a[2]), .y(to_reg[2]));
	_and2 U3_and2(.a(we), .b(w_a[3]), .y(to_reg[3]));
	_and2 U4_and2(.a(we), .b(w_a[4]), .y(to_reg[4]));
	_and2 U5_and2(.a(we), .b(w_a[5]), .y(to_reg[5]));
	_and2 U6_and2(.a(we), .b(w_a[6]), .y(to_reg[6]));
	_and2 U7_and2(.a(we), .b(w_a[7]), .y(to_reg[7]));
	
endmodule
