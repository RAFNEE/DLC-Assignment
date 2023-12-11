module bus_arbit(clk, reset_n, m0_req, m1_req, m0_grant, m1_grant);
	input clk, reset_n, m0_req, m1_req;
	output m0_grant, m1_grant;
	
	reg state, next_state;
	reg m0_grant, m1_grant;
	
	parameter M0_STATE = 1'b0;
	parameter M1_STATE = 1'b1;
	
	// if reset is 0
	always @ (posedge clk or negedge reset_n) begin
	
		if(reset_n == 0)
			state = M0_STATE;
		else state = next_state;
		
	end
	
	// state transition
	always @ (*) begin
	
		case (state)
		
		// M0 STATE
		M0_STATE: begin
			if (m0_req == 0 && m1_req == 0) begin		// both are zeros, M0
				next_state = M0_STATE;
			end
			else if (m0_req == 0 && m1_req == 1) begin		// m0 is 0 and m1 is 1, M1
				next_state = M1_STATE;
			end
			else if (m0_req == 1) begin		// m0 is 1, M0
				next_state = M0_STATE;
			end
			else begin
				next_state = 1'bx;
			end
		end
		
		// M1 STATE
		M1_STATE: begin
			if (m1_req == 1) begin		// m1 is 1, M1
				next_state = M1_STATE;
			end
			else if(m1_req == 0) begin		// m1 is 0, M0
				next_state = M0_STATE;
			end
			else begin
				next_state = 1'bx;
			end
		end
		
		default: begin		// default value
			next_state = 1'bx;
		end
		
		endcase
		
	end
	
	always @ (*) begin
		
		case (state)
		
		// M0 STATE, m0_grant is 1
		M0_STATE: begin
			m0_grant = 1'b1;
			m1_grant = 1'b0;
		end
		
		// M1 STATE, m1_grant is 1
		M1_STATE: begin
			m0_grant = 1'b0;
			m1_grant = 1'b1;
		end
		
		default: begin
			m0_grant = 1'bx;
			m1_grant = 1'bx;
		end
		
		endcase
		
	end
	
endmodule
