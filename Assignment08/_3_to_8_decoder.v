module _3_to_8_decoder(d, q);
	input [2:0] d;
	output [7:0] q;
	reg [7:0] q;
	
	always @ (d) begin
	
		// cases for d
		case(d)
		
			3'b000: q = 8'h01;		// 00000001
			3'b001: q = 8'h02;		// 00000010
			3'b010: q = 8'h04;		// 00000100
			3'b011: q = 8'h08;		// 00001000
			3'b100: q = 8'h10;		// 00010000
			3'b101: q = 8'h20;		// 00100000
			3'b110: q = 8'h40;		// 01000000
			3'b111: q = 8'h80;		// 10000000
			default: q = 8'hx;		// set don't care
			
		endcase
		
	end
	
endmodule
