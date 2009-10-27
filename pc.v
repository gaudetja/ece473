module pc (	input [31:0] ADDR,	input wire clk, input wire reset, output reg [31:0] PC);	
always @ (posedge clk)
begin
	PC = ADDR;
end
always @ (reset)
begin
	PC = 0;
end

endmodule 