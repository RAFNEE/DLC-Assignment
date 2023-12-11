`timescale 1ns/100ps

module tb_fifo;
	reg clk, reset_n, rd_en, wr_en;
	reg [31:0] d_in;
	wire [31:0] d_out;
	wire full, empty, wr_ack, wr_err, rd_ack, rd_err;
	wire [3:0] data_count;

	// instance fifo
	fifo Unit_fifo(.clk(clk), .reset_n(reset_n), .rd_en(rd_en), .wr_en(wr_en), .d_in(d_in), .d_out(d_out), .full(full), .empty(empty), .wr_ack(wr_ack), .wr_err(wr_err), .rd_ack(rd_ack), .rd_err(rd_err), .data_count(data_count));

	always begin
	
	#5; clk = ~clk;		// generate clock
	
	end
	
	initial begin
	
	// initialize signals
	clk = 0;
	reset_n = 0;
	rd_en = 0;
	wr_en = 0;
	d_in = 32'h00000000;

	// write and read data with reset
	#10; wr_en = 1; d_in = 32'h12345678;
	#10; rd_en = 1; wr_en = 0;
	#7; reset_n = 1;		// reset = 1
	
	#6; rd_en = 0; wr_en = 1; d_in = 32'h98765432;		// write, count = 1
	#10; wr_en = 1; d_in = 32'h11112222;		// write, count = 2
	#10; wr_en = 1; d_in = 32'h33334444;		// write, count = 3
	#10; rd_en = 1; wr_en = 0;		// read, count = 2
	#10; rd_en = 0; wr_en = 1; d_in = 32'haaaaffff;		// write, count = 3
	#10; wr_en = 1; d_in = 32'h12345678;		// write, count 4
	#10; rd_en = 1; wr_en = 0;		// read, count 3
	#10; rd_en = 0; wr_en = 1; d_in = 32'habcd0123;		// write, count 4
	#10; wr_en = 1; d_in = 32'h98761234;		// write, count 5
	#10; wr_en = 1; d_in = 32'hffeeddcc;		// write, count 6
	#10; wr_en = 1; d_in = 32'h55661122;		// write, count 7
	#10; wr_en = 1; d_in = 32'h43219876;		// write, count 8
	#10; wr_en = 1; d_in = 32'h99999999;		// full
	#10; wr_en = 0; rd_en = 1;		// read, count = 7
	#10; rd_en = 1;		// read, count = 6
	#10; rd_en = 1;		// read, count = 5
	#10; rd_en = 1;		// read, count = 4
	#10; rd_en = 1;		// read, count = 3
	#10; rd_en = 1;		// read, count = 2
	#10; rd_en = 1;		// read, count = 1
	#10; rd_en = 1;		// read, count = 0
	#10; rd_en = 1;		// empty
	#10; rd_en = 0; wr_en = 1; d_in = 32'h0001fff0;
	#10; wr_en = 1; d_in = 32'h9f8e7d6c;
	#10; wr_en = 0; rd_en = 1;
	
	// finish the simulation
	#10; $finish;
	
	end
	
endmodule
