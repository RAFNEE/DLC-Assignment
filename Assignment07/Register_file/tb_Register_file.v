`timescale 1ns/100ps

module tb_Register_file;
	reg clk, reset_n, we;
	reg [2:0] wAddr, rAddr;
	reg [31:0] wData;
	
	wire [31:0] rData;
	
	Register_file Unit_Register_file (.clk(clk), .reset_n(reset_n), .we(we), .wAddr(wAddr), .rAddr(rAddr), .wData(wData), .rData(rData));
	
	always begin
	
	#2; clk = ~clk;		// generate clock
	
	end
	
	initial begin
	
	// initialize signals
	clk = 0; reset_n = 0; we = 0; wAddr = 3'b000; rAddr = 3'b000; wData = 32'h00000000;
	
	// write operation
	#9; reset_n = 1;		// reset is 1
	we = 1;		// enable to write
	wAddr = 3'b000;		// set write address reg0
	wData = 32'h0000000f;		// written data
	
	#10; wAddr = 3'b001;		// set write address reg1
	wData = 32'h000000ff;
	
	#10; wAddr = 3'b010;		// set write address reg2
	wData = 32'h00000fff;
	rAddr = 3'b001;
	
	#10; wAddr = 3'b011;		// set write address reg3
	wData = 32'h0000ffff;
	
	#10; wAddr = 3'b100;		// set write address reg4
	wData = 32'h000f0000;
	
	#10; wAddr = 3'b101;		// set write address reg5
	wData = 32'h00ff0000;
	
	#10; wAddr = 3'b110;		// set write address reg6
	wData = 32'h0fff0000;
	
	#10; wAddr = 3'b111;		// set write address reg7
	wData = 32'hffff0000;
	#10; we = 0;

	// read operation
	// set address for register
	#10; rAddr = 3'b000;
	#10; rAddr = 3'b001;
	#10; rAddr = 3'b010;
	#10; rAddr = 3'b011;
	#10; rAddr = 3'b100;
	#10; rAddr = 3'b101;
	#10; rAddr = 3'b110;
	#10; rAddr = 3'b111;
	
	// finish the simulation
	#20; $finish;
	
	end
	 
 endmodule
 