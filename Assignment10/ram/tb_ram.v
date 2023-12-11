module tb_ram;
	reg clk, cen, wen;
	reg [4:0] addr;
	reg [31:0] din;
	wire [31:0] dout;
	
	// instance ram module
	ram Unit_ram(.clk(clk), .cen(cen), .wen(wen), .addr(addr), .din(din), .dout(dout));
	
	always begin
	
	#5; clk = ~clk;		// generate clock
	
	end
	
	initial begin
	
	// initialize signals
	clk = 0;
	cen = 0; wen = 0;
	addr = 5'b0;
	din = 32'b0;
	
	// test case
	#10; cen = 1; wen = 1; din = 32'h00001111;		// mem[0] = 32'h00001111
	#10; addr = 5'b00001; din = 32'h22223333;		// mem[1] = 32'h22223333
	#10; addr = 5'b00011; din = 32'h44445555;		// mem[3] = 32'h44445555
	#10; addr = 5'b10000; din = 32'hEEEEFFFF;		// mem[16] = 32'hEEEEFFFF
	
	#10; wen = 0; addr = 5'b00000;		// dout = 32'h00001111
	#10; addr = 5'b00001;		// dout = 32'h22223333
	#10; addr = 5'b00010;		// dout = 32'h0
	#10; addr = 5'b00011;		// dout = 32'h44445555
	#10; addr = 5'b10000;		// dout 32'hEEEEFFFF
	
	#10; cen = 0; addr = 5'b00011;		// dout = 32'h0
	#10; cen = 1; wen = 1; din = 32'h98765432;		// mem[3] = 332'h98765432
	#10; wen = 0;		// dout = 32'h98765432
	
	#10; cen = 1; wen = 1; addr = 5'b01000; din = 32'h12ABCDEF;		// mem[8] = 32'h12ABCDEF
	#10; wen = 0;		// dout = 32'h12ABCDEF
	
	// finish the simulation
	#10; $finish;
	
	end
	
endmodule
