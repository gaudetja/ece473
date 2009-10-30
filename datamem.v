module datamemory (
	input [31:0] ADDR,
	input [31:0] WD,
	input MemWrite,
	input MemRead,
	input clock,
	output [31:0] RD);

	
	reg [31:0] memory[0:50]; 
	reg [31:0] rd = 0;
	reg [31:0] wd = 0;
	integer i, data, k;
	
	assign RD = rd;
	
initial
	begin 
	for (k = 0; k < 50 ; k = k + 1)
	begin
		memory[k] = 32'h00;
	end
	$readmemh("date1.txt", memory);
end	

	always @(*)
		begin
			if (MemRead)
				begin
					rd <= memory[ADDR];
				end
			if (MemWrite)
				begin
					memory[ADDR] = wd;
				end
		end
	

endmodule

