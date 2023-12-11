`timescale 1ns/100ps

module tb_alu4;
	reg clk, reset;
	reg [3:0] tb_a, tb_b;
	reg [2:0] tb_op;
	wire [3:0] tb_result;		// 4-bit alu result
	wire tb_c, tb_n, tb_z, tb_v;		// condition flags
	
	reg [31:0] vectornum, errors;		// registers for testvectors
	reg [18:0] testvectors [1000:0];		// array for testvectors
	reg [3:0] expected_result;		// expected alu result
	reg expected_c, expected_n, expected_z, expected_v;		// expected flags: carry (c), negative (n), zero (z), and overflow (v)

	// instance 4-bit alu
	alu4 Unit_alu4(.a(tb_a), .b(tb_b), .op(tb_op), .result(tb_result), .c(tb_c), .n(tb_n), .z(tb_z), .v(tb_v));
	
	always begin
	  clk = 1; #5;
	  clk = 0; #5;
	end
	
	// load testvectors and pulse reset
	initial begin
	  $readmemb("tb_alu4.txt", testvectors); // read testvectors from a text file, "tb_alu4.txt"
	  vectornum = 0;
	  errors = 0;
	  reset = 1; #27;
	  reset = 0;
	end
	
	always @(posedge clk)		// testvectors on the rising edge of the clock
	begin
	  #1; {tb_a, tb_b, tb_op, expected_result, expected_c, expected_n, expected_z, expected_v} = testvectors[vectornum];
	end
	
	always @(negedge clk)		// results on the falling edge of the clock
	if (~reset) begin
	  if (tb_result !== expected_result | tb_c !== expected_c | tb_n !== expected_n | tb_z !== expected_z | tb_v !== expected_v) begin
		 $display("Error : inputs = a : %h, b : %h, op : %h", tb_a, tb_b, tb_op);
		 $display("outputs = result : %h, c : %h, n : %h, z : %h, v : %h (expected outputs = result : %h, c : %h, n : %h, z : %h, v : %h )", tb_result, tb_c, tb_n, tb_z, tb_v, expected_result, expected_c, expected_n, expected_z, expected_v);
		 errors = errors + 1;
	  end
		
	  // increment array and read the next test vector
	  vectornum = vectornum + 1;
	  if (testvectors[vectornum] === 19'bx) 
	  begin
		 $display("%d tests completed with %d errors", vectornum, errors);
		 #5;
		 
		 $finish;
	  end
	  
	end
	
endmodule
