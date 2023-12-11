`timescale 1ns/100ps

module tb_write_operation;
	reg we;
	reg [2:0] Addr;
	
	wire [7:0] to_reg;
	
	write_operation Unit_w_op(.Addr(Addr), .we(we), .to_reg(to_reg));
	
	initial begin
	
	// initialize signals
	Addr = 3'bx; we = 0;
	
	// write data each reg
	#5; Addr = 3'b000;
	#5; Addr = 3'b001;
	#5; Addr = 3'b010;
	#5; Addr = 3'b011;
	#5; Addr = 3'b100;
	#5; Addr = 3'b101;
	#5; Addr = 3'b110;
	#5; Addr = 3'b111;
	
	// enable and write data each reg
	#10; we = 1;
	#5; Addr = 3'b000;
	#5; Addr = 3'b001;
	#5; Addr = 3'b010;
	#5; Addr = 3'b011;
	#5; Addr = 3'b100;
	#5; Addr = 3'b101;
	#5; Addr = 3'b110;
	#5; Addr = 3'b111;
	
	#10; $finish;
	
	end
	
endmodule
