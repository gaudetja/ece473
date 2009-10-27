module counter (input clk, input reset, output [3:0] HEX0, output [3:0] HEX1, output [3:0] HEX2, output [3:0] HEX3);

	reg [15:0] out;
	
	assign HEX0 = out[3:0];
	assign HEX1 = out[7:4];
	assign HEX2 = out[11:8];
	assign HEX3 = out[15:12];
	
	initial
	begin
		out = 0; 
	end
		
	always @ (posedge clk)
	begin
		out <= out + 1;
		if (reset)
		begin
			out <= 0;
		end
	end 
endmodule 