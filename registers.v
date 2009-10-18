module registersv (
	input [4:0] RN1,
	input [4:0] RN2,
	input [4:0] WN,
	input [31:0] WD,
	input RegWrite,
	input clock,
	input reset,
	output [31:0] RD1,
	output [31:0] RD2);
	
	integer i;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	reg [4:0] rd1;
	reg [4:0] rd2;
	reg [31:0] regs [31:0]; 
	assign rs = RN1;
	assign rt = RN1;
	assign rd = WN;
	assign RD1 = rd1;
	assign RD2 = rd2;
			
always @(posedge clock)
	begin
		// The reset signal overrides the hold signal; reset the value to 0
		if (reset)
		begin
			for(i = 0; i <= 15; i = i+1) begin
				regs [i] <= i;
			end
		end
		// Otherwise, change the variable only when updates are enabled
		else
		begin
			if (RegWrite) regs[rd] = WD;
			rd1 <= regs[rs];
			rd2 <= regs[rt];
		end
	end

endmodule