module instrucmemory (
	input [31:0] ADDR,
	input clock,
	output [31:0] RD);

	reg [31:0] memory[0:50]; 
	reg [31:0] rd;
	integer i, data;
		
	assign RD = rd;

initial
	begin 
	$readmemh("prog3.txt", memory);
end	
	always @(*)
		begin
			rd <= memory[ADDR/4];
		end
endmodule 