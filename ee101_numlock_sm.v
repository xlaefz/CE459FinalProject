module ee101_numlock_sm(u,z,clk,rst,unlock,q0,q1,q2,q3);

input u,z,clk,rst;
output unlock, q0, q1,q2, q3;

reg unlock;
reg[3:0] state;
reg [3:0] state_d;

assign [q3,q2,q1,q0] = state;

localparam INITIAL =4'b0000;
localparam G1GET = 4'b0001;
localparam G1 = 4'b0010;
localparam G
....



always@(state)
begin
	case(state)
		INITIAL:
		if(UZ == 2'b10)
			state_d <= G1GET;
		
		G1GET:
		if(U ==1)
			state_d <=G1GET;
		else
			state_d <= G1;

		G1:
		if(U == 0 & Z == 0)
			state_d <= G1;
		else if(U == 0 && Z == 1)
			state_d <= G10GET;
		else 
			state_d <= BAD;

		G10GET:
		if(Z == 1)
			state_d <= G10GET;
		else if(Z == 0)
			state_d <= G10;

		G10:
		if(U == 0 && Z == 0)
			state_d <= G10;
		else if(U == 1 && Z == 0)
			state_d <= G101GET;
		else
			state_d <= BAD;

		G101GET:
		if(U == 1)
			state_d <= G101GET;
		else if(U == 0)
			state_d <= G101;

		G101:
		if(U == 0 && Z == 0)
			state_d <= G101;
		else if(U == 1 && Z == 0)
			state_d <= G1011GET;
		else
			state_d <= BAD;

		G1011GET:
		if(U == 1)
			state_d <= G1011GET;
		else if(U == 0)
			state_d <= G1011;

		G1011:
			state_d <= OPENING;

		OPENING:
			if(timeout == 1)
				state_d <= INITIAL;

		BAD:
			if(U != 0 && Z!= 0)
				state_d <= BAD;
			else
				state_d <= INITIAL;
		default:
			state_d <= INITIAL;
		endcase
	end
end

	assign timerout = (timerout_count == 4'b1111);
	always @ (posedge clk, posedge rst)
	begin
		if (rst)
			timerout_count <= 4'b0000;
		else if (timerout_count== 4'b1111)
			timerout_count <= 4'b0000;		
		else if (q_Opening)
			timerout_count <= timerout_count + 4'b0001;
	end

	always@(posedge clk)
	begin
		if(rst == 1)
			state == INITIAL;
		else
			state == state_d;
endmodule