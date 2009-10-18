module pc (
	input [31:0] ADDR,
	input wire clk,
	output [31:0] PC);
	
	reg [31:0] regs;
	
	assign PC = regs;
	
always @ (posedge clk)
begin
	regs <= ADDR;
end

endmodule 