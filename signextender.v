//sign extender

module signextender(input [15:0] in, output reg [31:0] out);
integer i;
always @(*)
begin
	for (i=0; i < 16; i = i + 1)  // Setting individual memory cells to 0
	begin
		out[i] = in[i];
	end
	
	for (i=16; i<32; i = i+1)
	begin
		out[i] = in[15];
	end
end

endmodule
