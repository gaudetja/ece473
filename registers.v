module registers (
	input wire [4:0] RN1,
	input wire [4:0] RN2,
	input wire [4:0] WN,
	input wire [31:0] WD,
	input wire RegWrite,
	input wire clock,
	input wire reset,
	output reg [31:0] RD1,
	output reg [31:0] RD2);

	integer i,k;
	reg [31:0] regs [0:31]; 
	
	
	initial
	begin
		for(i = 0; i <= 31; i = i+1)
			begin
				regs [i] = 0;
			end
	end

	always @(clock) 
	begin
			if(clock) begin	
				RD1 = regs[RN1];
				RD2 = regs[RN2];
			end
	end

	always @(negedge clock)
	begin
		if (RegWrite)
		begin
			regs[WN] = WD;
		end
		
		if (reset)
		
		begin
			for(i = 0; i <= 31; i = i+1)
				begin
					regs [i] = 0;
				end
		end
		
	end

endmodule 