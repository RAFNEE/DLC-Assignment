`timescale 1ns/100ps

module tb_alu32;

	reg clk, reset;
	reg [31:0] tb_a, tb_b;
	reg [2:0] tb_op; // operation code
	wire [31:0] tb_result; // result
	wire tb_c, tb_n, tb_z, tb_v; // alu condition flags

	reg [31:0] vectornum, errors; // testvectors variable
	reg [111:0] testvectors [1000:0]; // array to testvector
	reg [31:0] expected_result; // expected result
	reg expected_c, expected_n, expected_z, expected_v; // expected condition flags
	reg dummy; // dummy variable for testvectors

	// instance 32-bit alu
	alu32 Unit_alu32(.a(tb_a), .b(tb_b), .op(tb_op), .result(tb_result), .c(tb_c), .n(tb_n), .z(tb_z), .v(tb_v));

	// generate clock
	always begin
		 clk = 1; #5;
		 clk = 0; #5;
	end

	initial begin
		 $readmemh("tb_alu32.txt", testvectors); // read testvectors from a file, "tb_alu32.txt"
		 vectornum = 0;
		 errors = 0;
		 reset = 1; #30;
		 reset = 0;
	end

	// every rising edge of the clock
	always @ (posedge clk) begin
		 #1;
		 // Assign values from the test vector array to the testbench inputs and expected outputs
		 {tb_a, tb_b, dummy, tb_op, expected_result, expected_c, expected_n, expected_z, expected_v} = testvectors[vectornum];
	end

	// every falling edge of the clock
	always @ (negedge clk) begin
		 if (~reset) begin
			  // check errors
			  if (tb_result !== expected_result | tb_c !== expected_c | tb_n !== expected_n | tb_z !== expected_z | tb_v !== expected_v) begin
					$display("Error : inputs = a : %h, b : %h, op : %h", tb_a, tb_b, tb_op);
					$display("outputs = result : %h, c : %h, n : %h, z : %h, v : %h (expected outputs = result : %h, c : %h, n : %h, z : %h, v : %h)", tb_result, tb_c, tb_n, tb_z, tb_v, expected_result, expected_c, expected_n ,expected_z, expected_v);
					errors = errors + 1;
			  end
			  
			  vectornum = vectornum + 1;
			  if (testvectors[vectornum] === 112'hx) begin
					$display("%d tests completed with %d errors", vectornum, errors);
					#5;
					
					$finish;
			  end
			  
		 end
		 
	end

endmodule
