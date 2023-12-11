module ram(clk, cen, wen, addr, din, dout);
	input clk, cen, wen;
	input [4:0] addr;
	input [31:0] din;
	output reg [31:0] dout;
	
	reg [31:0] mem [0:31];
	
	// initialize mem memory
	integer i;
	initial begin
		for (i = 0; i < 32; i = i + 1) begin
			mem[i] = 32'h0;
		end
	end
	
	always @ (posedge clk) begin
		
		// if cen == 1 && wen == 1, write din in mem
		if (cen == 1 && wen == 1) begin
			mem[addr] = din;
			dout = 32'h0;
		end
		// if cen == 1 && wen == 0, read dout in mem
		else if (cen == 1 && wen == 0) begin
			dout = mem[addr];
		end
		// if cen == 0, dout must be 0
		else if (cen == 0) begin
			dout = 32'h0;
		end
		else begin
			dout = 32'hx;
		end
	
	end
	
endmodule
