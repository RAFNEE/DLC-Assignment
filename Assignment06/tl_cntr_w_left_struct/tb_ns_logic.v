`timescale 1ns/100ps

module tb_ns_logic;
	reg Ta, Tal, Tb, Tbl;
	reg [2:0] state;
	wire [2:0] next_state;
	
	ns_logic Unit_ns_logic(.Ta(Ta), .Tal(Tal), .Tb(Tb), .Tbl(Tbl), .state(state), .next_state(next_state));
	
	initial begin
	
	// initialize signals
	Ta = 0; Tal = 0; Tb = 0; Tbl = 0; state = 3'b000;
	
	#10; Ta = 1; Tal = 0; Tb = 1; Tbl = 0;
	#10; Ta = 0; Tal = 0; Tb = 1; Tbl = 1;
	#10; Ta = 1; Tal = 1; Tb = 0; Tbl = 0;
	#10; Ta = 0; Tal = 1; Tb = 0; Tbl = 1;
	#10; Ta = 1; Tal = 0; Tb = 0; Tbl = 0; state = 3'b001;
	
	#10; Ta = 1; Tal = 0; Tb = 1; Tbl = 0;
	#10; Ta = 0; Tal = 0; Tb = 1; Tbl = 1;
	#10; Ta = 1; Tal = 1; Tb = 0; Tbl = 0;
	#10; Ta = 0; Tal = 1; Tb = 0; Tbl = 1;
	#10; Ta = 1; Tal = 0; Tb = 0; Tbl = 0; state = 3'b010;
	
	#10; Ta = 1; Tal = 0; Tb = 1; Tbl = 0;
	#10; Ta = 0; Tal = 0; Tb = 1; Tbl = 1;
	#10; Ta = 1; Tal = 1; Tb = 0; Tbl = 0;
	#10; Ta = 0; Tal = 1; Tb = 0; Tbl = 1;
	#10; Ta = 1; Tal = 0; Tb = 0; Tbl = 0; state = 3'b011;
	
	#10; Ta = 1; Tal = 0; Tb = 1; Tbl = 0;
	#10; Ta = 0; Tal = 0; Tb = 1; Tbl = 1;
	#10; Ta = 1; Tal = 1; Tb = 0; Tbl = 0;
	#10; Ta = 0; Tal = 1; Tb = 0; Tbl = 1;
	#10; Ta = 1; Tal = 0; Tb = 0; Tbl = 0; state = 3'b100;
	
	#10; Ta = 1; Tal = 0; Tb = 1; Tbl = 0;
	#10; Ta = 0; Tal = 0; Tb = 1; Tbl = 1;
	#10; Ta = 1; Tal = 1; Tb = 0; Tbl = 0;
	#10; Ta = 0; Tal = 1; Tb = 0; Tbl = 1;
	#10; Ta = 1; Tal = 0; Tb = 0; Tbl = 0; state = 3'b101;
	
	#10; Ta = 1; Tal = 0; Tb = 1; Tbl = 0;
	#10; Ta = 0; Tal = 0; Tb = 1; Tbl = 1;
	#10; Ta = 1; Tal = 1; Tb = 0; Tbl = 0;
	#10; Ta = 0; Tal = 1; Tb = 0; Tbl = 1;
	#10; Ta = 1; Tal = 0; Tb = 0; Tbl = 0; state = 3'b110;
	
	#10; Ta = 1; Tal = 0; Tb = 1; Tbl = 0;
	#10; Ta = 0; Tal = 0; Tb = 1; Tbl = 1;
	#10; Ta = 1; Tal = 1; Tb = 0; Tbl = 0;
	#10; Ta = 0; Tal = 1; Tb = 0; Tbl = 1;
	#10; Ta = 1; Tal = 0; Tb = 0; Tbl = 0; state = 3'b111;
	
	#10; Ta = 1; Tal = 0; Tb = 1; Tbl = 0;
	#10; Ta = 0; Tal = 0; Tb = 1; Tbl = 1;
	#10; Ta = 1; Tal = 1; Tb = 0; Tbl = 0;
	#10; Ta = 0; Tal = 1; Tb = 0; Tbl = 1;
	#10; Ta = 1; Tal = 0; Tb = 0; Tbl = 0; state = 3'b000;
	
	#10; Ta = 0; Tal = 1; Tb = 1; Tbl = 1;
	
	#10; $finish;
	
	end
	
endmodule
