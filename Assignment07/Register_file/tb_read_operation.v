`timescale 1ns/100ps

module tb_read_operation;
	reg [31:0] from_reg0, from_reg1, from_reg2, from_reg3, from_reg4, from_reg5, from_reg6, from_reg7;
	reg [2:0] Addr;
	
	wire [31:0] Data;
	
	read_operation Unit_r_op(.Addr(Addr), .Data(Data), .from_reg0(from_reg0), .from_reg1(from_reg1), .from_reg2(from_reg2), .from_reg3(from_reg3), .from_reg4(from_reg4), .from_reg5(from_reg5), .from_reg6(from_reg6), .from_reg7(from_reg7));
	
	initial begin
	
	// initialize signals
	Addr = 3'bx;
	// set each reg
	from_reg0 = 32'h0000000f;
	from_reg1 = 32'h000000ff;
	from_reg2 = 32'h00000fff;
	from_reg3 = 32'h0000ffff;
	from_reg4 = 32'h000f0000;
	from_reg5 = 32'h00ff0000;
	from_reg6 = 32'h0fff0000;
	from_reg7 = 32'hffff0000;
	
	#5; Addr = 3'b000;		// reg0
	#5; Addr = 3'b001;		// reg1
	#5; Addr = 3'b010;		// reg2
	#5; Addr = 3'b011;		// reg3
	#5; Addr = 3'b100;		// reg4
	#5; Addr = 3'b101;		// reg5
	#5; Addr = 3'b110;		// reg6
	#5; Addr = 3'b111;		// reg7
	
	#10; $finish;
	
	end
	
endmodule
