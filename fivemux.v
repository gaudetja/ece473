module fivemux(input [4:0] a, input [4:0] b, input sel, output reg [4:0] c);
always@(*) begin
	if(sel) 
	begin
	c = a;
	end
	else 
	begin
	c = b;
	end
end

endmodule
