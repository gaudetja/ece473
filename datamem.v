module datamemory (
	input [31:0] ADDR,
	input [31:0] WD,
	input MemWrite,
	input MemRead,
	input clock,
	output [31:0] RD);

	parameter MEM = 1;
	reg [31:0] memory[0:MEM]; 
	reg [31:0] rd = 0;
	reg [31:0] wd = 0;
	integer i, data, k;
	
	assign RD = rd;
	
initial
	begin 
	for (k = 0; k < MEM ; k = k + 1)
	begin
		memory[k] = 32'h00;
	end
	$readmemh("date1.txt", memory);
end	

	always @(*)
		begin
			if (MemRead)
				begin
					i = (ADDR - 4097)>>2;
					rd = memory[i];
				end
			if (MemWrite)
				begin
					//memory[ADDR] = wd;
				end
		end
	

endmodule

