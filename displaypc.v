module displayPC (input [31:0] pc, output reg [3:0] dig1, output reg [3:0] dig2);
always @(*) begin
dig1 = (pc >>4);
dig2 = pc;
end
endmodule
