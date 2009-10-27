module lefttwo(input [31:0] in, output reg [31:0] out);
always @(*)
begin
	out[31:2]=in[29:0];
	out[1]=0;
	out[0]=0;
end
endmodule
