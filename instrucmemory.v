module instrucmemory (
	input [31:0] ADDR,
	output [31:0] RD);

	parameter MEM = 18;
	reg [31:0] memory[0:MEM]; 
	reg [31:0] rd = 0;
	integer i, k, data;
		
	assign RD = rd;

initial
	begin 
	for (k = 0; k < MEM ; k = k + 1)
	begin
		memory[k] = 32'h00;
	end
	$readmemh("prog3.txt", memory);
end	
	always @(*)
		begin
			i = ADDR>>2 +1;
			rd <= memory[i];
		end
endmodule 
