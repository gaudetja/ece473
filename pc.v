module pc (	input [31:0] ADDR,	input wire clk, input wire reset, output reg [31:0] PC);	
always @ (posedge clk)
begin
	if (reset) PC =0;
	else PC = ADDR;
end
endmodule 