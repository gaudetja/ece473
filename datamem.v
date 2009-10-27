module datamemory (
	input [31:0] ADDR,
	input [31:0] WD,
	input MemWrite,
	input MemRead,
	input clock,
	output [31:0] RD);

	
	reg [31:0] memory[0:13]; 
	reg [31:0] rd;
	reg [31:0] wd;
	integer i, data;
	
	assign RD = rd;
	
initial
	begin 
	$readmemh("date1.txt", memory);
end	

	always @(posedge clock)
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

