module registers (
	input [4:0] RN1,
	input [4:0] RN2,
	input [4:0] WN,
	input [31:0] WD,
	input RegWrite,
	input clock,
	input reset,
	output [31:0] RD1,
	output [31:0] RD2);
	
	integer i,k;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	reg [31:0] rd1;
	reg [31:0] rd2;
	reg [31:0] regs [31:0]; 
	assign rs = RN1;
	assign rt = RN1;
	assign rd = WN;
	assign RD1 = rd1;
	assign RD2 = rd2;
	
initial
	begin
	for (k = 0; k < 31 ; k = k + 1)
	begin
		regs[k] = 32'h00;
	end
end
	
always @(clock) begin
		// The reset signal overrides the hold signal; reset the value to 0
	if(clock) begin
		if (reset)	begin
			for(i = 0; i <= 15; i = i+1) begin
				regs [i] <= i;
			end
		end
		// Otherwise, change the variable only when updates are enabled
		else
		begin
			rd1 = regs[rs];
			rd2 = regs[rt];
		end
	end
	
	if (!clock)
	begin
		if (RegWrite) regs[rd] = WD;
	end
end
endmodule 