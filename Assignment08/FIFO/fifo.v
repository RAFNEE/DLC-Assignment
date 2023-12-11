module fifo(clk, reset_n, rd_en, wr_en, d_in, d_out, full, empty, wr_ack, wr_err, rd_ack, rd_err, data_count);
	input clk, reset_n, rd_en, wr_en;
	input [31:0] d_in;
	output [31:0] d_out;
	output full, empty, wr_ack, wr_err, rd_ack, rd_err;
	output [3:0] data_count;
	
	// set states
	parameter INIT_STATE = 3'b000;
	parameter WRITE_STATE = 3'b001;
	parameter READ_STATE = 3'b010;
	parameter WR_ERR_STATE = 3'b011;
	parameter RD_ERR_STATE = 3'b100;
	parameter NO_OP_STATE = 3'b101;
	
	// declare reg to store values
	reg we, re;
	reg full, empty, wr_ack, wr_err, rd_ack, rd_err;
	reg [2:0] state;
	reg [3:0] data_count;
	reg [2:0] head, tail;
	reg [2:0] next_state, next_head, next_tail;
	reg [3:0] next_data_count;
	reg [31:0] d_out, next_d_out;
	
	// declare wire to connect
	wire [31:0] rData;
	
	// instance register file
	Register_file Unit_RF(.clk(clk), .reset_n(reset_n), .wAddr(tail), .wData(d_in), .we(we), .rAddr(head), .rData(rData));
	
	// for next state
	always @ (wr_en, rd_en, state, next_state, data_count) begin
		
		case(state)
		
		INIT_STATE:
		if(wr_en == 0 && rd_en == 0)
		next_state = NO_OP_STATE;		// wr_en = 0 and rd_en = 0, NO_OP_STATE
		else if(wr_en == 1 && data_count < 8)
		next_state = WRITE_STATE;		// wr_en = 1 and data_count < 8, WRITE_STATE
		else if(rd_en == 1 && data_count > 0)
		next_state = READ_STATE;		// rd_en = 1 and data_count > 0, READ_STATE
		else if(wr_en == 1 && data_count == 8)
		next_state = WR_ERR_STATE;		// wr_en = 1 and data_count = 8, full, WR_ERR_STATE
		else if(rd_en == 1 && data_count == 0)
		next_state = RD_ERR_STATE;		// rd_en = 1 and data_count = 0, empty, RD_ERR_STATE
		else
		next_state = 3'bxxx;		// no change

		WRITE_STATE:
		if(wr_en == 1 && data_count < 8)
		next_state = WRITE_STATE;		// wr_en = 1 and data_count < 8, WRITE_STATE
		else if(wr_en == 1 && data_count == 8)
		next_state = WR_ERR_STATE;		// wr_en = 1 and data_count = 8, set full, WR_ERR_STATE
		else if(rd_en == 1)
		next_state = READ_STATE;		// rd_en = 1, READ_STATE
		else if(wr_en == 0 && rd_en == 0)
		next_state = NO_OP_STATE;		// wr_en = 0 and rd_en = 0, NO_OP_STATE
		else
		next_state = 3'bxxx;		// no change

		READ_STATE:
		if(rd_en == 1 && data_count > 0)
		next_state = READ_STATE;		// rd_en = 1 and data_count > 0, READ_STATE
		else if(rd_en == 1 && data_count == 0)
		next_state = RD_ERR_STATE;		// rd_en = 1 and data_count = 0, set empty, RD_ERR_STATE
		else if(wr_en == 1)
		next_state = WRITE_STATE;		// wr_en = 1 WRITE_STATE
		else if(rd_en == 0 && wr_en == 0)
		next_state = NO_OP_STATE;		// wr_en = 0 and rd_en = 0, NO_OP_STATE
		else
		next_state = 3'bxxx;		// no change

		WR_ERR_STATE:
		if(wr_en == 1)
		next_state = WR_ERR_STATE;		// wr_en = 1, WR_ERR_STATE
		else if(rd_en == 1)
		next_state = READ_STATE;		// rd_en = 1, READ_STATE
		else if(wr_en == 0 && rd_en == 0)
		next_state = NO_OP_STATE;		// wr_en = 0 and rd_en = 0, NO_OP_STATE
		else
		next_state = 3'bxxx;		// no change

		RD_ERR_STATE:
		if(rd_en == 1)
		next_state = RD_ERR_STATE;		// rd_en = 1, RD_ERR_STATE
		else if(wr_en == 1)
		next_state = WRITE_STATE;		// wr_en = 1, WRITE_STATE
		else if(rd_en == 0 && wr_en == 0)
		next_state = NO_OP_STATE;		// wr_en = 0 and rd_en = 0, NO_OP_STATE
		else
		next_state = 3'bxxx;		// no change
		
		NO_OP_STATE:
		if(wr_en == 1 && data_count < 8)
		next_state = WRITE_STATE;		// wr_en = 1, WRITE_STATE
		else if(rd_en == 1 && data_count > 0)
		next_state = READ_STATE;		// rd_en = 1, READ_STATE
		else if(wr_en == 1 && data_count == 8)
		next_state = WR_ERR_STATE;		// wr_en = 1, full, WR_ERR_STATE
		else if(rd_en == 1 && data_count == 0)
		next_state = RD_ERR_STATE;		// rd_en = 1, empty, RD_ERR_STATE
		else
		next_state = 3'bxxx;		// no change
		
		default: next_state = 3'bxxx;		// set don't care
		
		endcase
		
	end
	
	// sequential circuit
	always @ (posedge clk or negedge reset_n) begin
	
		if(reset_n == 0) begin
		state <= INIT_STATE;
		data_count <= 0;
		head <= 0;
		tail <= 0;
		d_out <= 0;
		end
		else if(reset_n == 1) begin
		state <= next_state;
		data_count <= next_data_count;
		head <= next_head;
		tail <= next_tail;
		d_out <= next_d_out;
		end
		else begin
		state <= 3'bxxx;
		data_count <= 4'bxxxx;
		head <= 3'bxxx;
		tail <= 3'bxxx;
		d_out <= 32'hxxxxxxxx;
		end
		
	end
	
	// for output
	always @ (state, data_count) begin
	
		case(state)
		
		INIT_STATE:
		if(data_count == 0) begin
		full = 0; empty = 1; wr_ack = 0; wr_err = 0; rd_ack = 0; rd_err = 0;		// data_count is 0, empty flag 1
		end
		else if(data_count == 8) begin
		full = 1; empty = 0; wr_ack = 0; wr_err = 0; rd_ack = 0; rd_err = 0;		// data_count is 8, full flag 1
		end
		else begin
		full = 0; empty = 0; wr_ack = 0; wr_err = 0; rd_ack = 0; rd_err = 0;		// all flag 0
		end
		
		WRITE_STATE:
		if(data_count == 8) begin
		full = 1; empty = 0; wr_ack = 0; wr_err = 1; rd_ack = 0; rd_err = 0;		// data_count is 8, full, wr_err flag 1
		end
		else begin
		full = 0; empty = 0; wr_ack = 1; wr_err = 0; rd_ack = 0; rd_err = 0;		// wr_ack flag 1
		end
		
		READ_STATE:
		if(data_count == 0) begin
		full = 0; empty = 1; wr_ack = 0; wr_err = 0; rd_ack = 0; rd_err = 1;		// data_count is 0, empty, rd_err flag 1
		end
		else begin
		full = 0; empty = 0; wr_ack = 0; wr_err = 0; rd_ack = 1; rd_err = 0;		// rd_ack flag 1
		end
		
		WR_ERR_STATE: begin
		full = 0; empty = 0; wr_ack = 0; wr_err = 1; rd_ack = 0; rd_err = 0;		// WR_ERR_STATE full, wr_err flag 1
		end
		
		RD_ERR_STATE: begin
		full = 0; empty = 0; wr_ack = 0; wr_err = 0; rd_ack = 0; rd_err = 1;		// RD_ERR_STATE empty, rd_err flag 1
		end
		
		NO_OP_STATE: begin
		if(data_count == 8) begin
		full = 1; empty = 0; wr_ack = 0; wr_err = 0; rd_ack = 0; rd_err = 0;		// data_count is 8, full
		end
		else if(data_count == 0) begin
		full = 0; empty = 1; wr_ack = 0; wr_err = 0; rd_ack = 0; rd_err = 0;		// data_count is 0, empty
		end
		else begin
		full = 0; empty = 0; wr_ack = 0; wr_err = 0; rd_ack = 0; rd_err = 0;		// all zeros
		end
		end
		
		default: begin
		full = 1'bx; empty = 1'bx; wr_ack = 1'bx; wr_err = 1'bx; rd_ack = 1'bx; rd_err = 1'bx;		// set don't care
		end
		
		endcase
		
	end
	
	// for calculate address
	always @ (next_state, head, tail, data_count) begin
	
		case(next_state)
		
		INIT_STATE: begin		// INIT_STATE: store head, tail, data_count value
		next_head = head;		// store next_head, next_tail, next_data_count value
		next_tail = tail;
		next_data_count = data_count;
		we = 1'b0;		// we is 0
		re = 1'b0;		// re is 0
		end
		
		WRITE_STATE: begin
		next_head = head;		// WRITE_STATE: store head, tail + 1, data_count value + 1
		next_tail = tail + 3'b1;		// store next_head, next_tail, next_data_count value
		next_data_count = data_count + 4'b1;
		we = 1'b1;		// we is 1 because of write state
		re = 1'b0;		// re is 0
		end
		
		READ_STATE: begin
		next_head = head + 3'b1;		// READ_STATE: store head + 1, tail, data_count value - 1
		next_tail = tail;		// store next_head, next_tail, next_data_count value
		next_data_count = data_count - 4'b1;
		we = 1'b0;		// we is 0
		re = 1'b1;		// re is 1 because of read state
		end
		
		WR_ERR_STATE: begin
		next_head = head;		// WE_ERR_STATE: store head, tail, data_count value
		next_tail = tail;		// store next_head, next_tail, next_data_count value
		next_data_count = data_count;	
		we = 1'b0;		// we is 0
		re = 1'b0;		// re is 0
		end
		
		RD_ERR_STATE: begin
		next_head = head;		// RD_ERR_STATE: store head, tail, data_count value
		next_tail = tail;		// store next_head, next_tail, next_data_count value
		next_data_count = data_count;
		we = 1'b0;		// we is 0
		re = 1'b0;		// re is 0
		end
		
		NO_OP_STATE: begin
		next_head = head;		// NO_OP_STATE: store head, tail, data_count value
		next_tail = tail;		// store next_head, next_tail, next_data_count value
		next_data_count = data_count;
		we = 1'b0;		// we is 0
		re = 1'b0;		// re is 0
		end
		
		default: begin
		next_head = 3'bxxx;		// set don't care
		next_tail = 3'bxxx;
		next_data_count = 4'bxxxx;
		we = 1'bx;
		re = 1'bx;
		end
		
		endcase
	
	end
	
	// select data output
	always @ (re, rData) begin
	
		if(re == 1)
		next_d_out <= rData;
		else
		next_d_out <= 32'h00000000;
		
	end
	
endmodule
