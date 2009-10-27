module pc (	input [31:0] ADDR,	input wire clk,	output reg [31:0] PC);	
always @ (posedge clk)
begin
	PC = ADDR;
end

endmodule 