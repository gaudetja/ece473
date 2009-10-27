module displayPC (input [31:0] pc, output reg [7:0] dig1, output reg [7:0] dig2);
always @(*) begin
dig1 = 2'hFF&(pc /10);
dig2 = 2'hFF&(pc);
end
endmodule
