module bus_addr(s_address, s0_sel, s1_sel);
	input [7:0] s_address;
	output s0_sel, s1_sel;
	
	reg s0_sel, s1_sel;
	wire [2:0] upper_3bit;
	
	assign upper_3bit = s_address[7:5];		// to check correct address between 0x00 ~ 0x19 and 0x20 ~ 0x39
	
	always @ (upper_3bit) begin
	
		if (upper_3bit == 3'b000) begin		// 0x00 ~ 0x19
			s0_sel = 1'b1;
			s1_sel = 1'b0;
		end
		else if (upper_3bit == 3'b001) begin		// 0x20 ~ 0x39
			s0_sel = 1'b0;
			s1_sel = 1'b1;
		end
		else begin		// else wrong address
			s0_sel = 1'b0;
			s1_sel = 1'b0;
		end
		
	end
	
endmodule
