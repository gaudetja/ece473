module instrucmemory (
	input [31:0] ADDR,
	input clock,
	output [31:0] RD);

	reg [31:0] memory[0:13]; 
	reg [31:0] rd;
	integer i, data;
		
	assign RD = rd;

initial
	begin 
	$readmemh("date1.txt", memory);
end	
	always @(posedge clock)
		begin
			rd <= memory[ADDR];
		end
endmodule 