//32 bit MUX

module thirtytwomux(input sel, input [31:0] input1, input [31:0] input2, output reg [31:0] out);
integer i;
always @(*)
begin
	if (sel == 1'b1) out[32:0] = input1[31:0];
	else		out[32:0] = input2[31:0];	
end
endmodule
