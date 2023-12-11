`timescale 1ns/100ps

module tb_3_to_8_decoder;
	reg [2:0] d;
	wire [7:0] q;
	
	_3_to_8_decoder Unit_3_to_8_decoder(.d(d), .q(q));
	
	initial begin
	
	d = 3'b000;
	#10; d = 3'b001;
	#10; d = 3'b010;
	#10; d = 3'b011;
	#10; d = 3'b100;
	#10; d = 3'b101;
	#10; d = 3'b110;
	#10; d = 3'b111;
	
	#10; $finish;
	
	end
	
endmodule
