

module datamemory (
	input [31:0] ADDR,
	input [31:0] WD,
	input MemWrite,
	input MemRead,
	input clock,
	output [31:0] RD);

	parameter MEMORY = 100;

	reg [31:0] memory [MEMORY-1:0]; 
	reg [31:0] rd;
	integer i, data;
	
	
	assign RD = rd;
	
initial
begin : file_block

	$readmemh("date1.txt", memory);
end	
	always @(posedge clock)
		begin
			if (MemRead)
				begin
					rd <= memory[ADDR];
				end
		end
	

endmodule

