module controller ( 
	input [5:0] func,
	input [5:0] op,
	input zero,
	input clk,
	output reg [2:0] ALU,
	output reg ALUsrc,
	output reg Jump,
	output reg Branch,
	output reg MemWrite,
	output reg MemRead,
	output reg MemtoReg,
	output reg RegWrite,
	output reg RegDest
	);
	
	parameter AND = 3'b000;
	parameter OR  = 3'b001;
	parameter ADD = 3'b010;
	parameter SUB = 3'b110;
	parameter SLL = 3'b011;
	parameter SRL = 3'b100;
	parameter SLT = 3'b111;
	parameter SRA = 3'b101;
	
	
always @ (posedge clk)
	begin
	// x and z values are NOT treated as don't-care's
	ALU = 0;
	ALUsrc = 0;
	Jump = 0;
	Branch = 0;
	MemWrite = 0;
	MemRead = 0; 
	MemtoReg = 0; 
	RegWrite = 0;
	RegDest = 0;
	
	// R-Type
	if (op == 0)
		begin
		RegDest = 1;
		RegWrite = 1;
		ALUsrc = 0;
		case(func)
			6'b100000:	ALU = ADD; 	//add
			6'b100001:	ALU = ADD;	//addu
			6'b100010:	ALU = SUB;	//sub
			6'b100011:	ALU = SUB; 	//subu
			6'b100100:	ALU = AND;	//and
			6'b100101:	ALU = OR;   //or
			6'b100111:	ALU = OR;	//nor
			6'b101010:	ALU = SLT;	//slt
			6'b000000:	ALU = SLL; 	//sll
			6'b000010:	ALU = SRL; 	//srl
			6'b000011:	ALU = SRA;	//sra
			6'b001000:  begin 
						Jump = 1;	//jr
						RegWrite = 0;
						end
		endcase
		end
	// I and J type
	else
		begin
		RegDest = 0;
		RegWrite = 1;
		ALUsrc = 1;
		case (op)
			6'b001100:	ALU = AND;	//andi
			6'b001101:	ALU = OR;	//ori
			6'b001010:	ALU = SLT;	//slti
			6'b001000:	ALU = ADD;	//addi
			6'b001001:	ALU = SUB;	//subi
			6'b000100:	if (zero) 
							begin 
							Branch = 1;	//beq
							RegWrite = 0;
							end
			6'b000101:	if (!zero)
							begin
							Branch = 1;	//bne
							RegWrite = 0;
							end
			6'b100011:	begin
						ALU = ADD;
						MemtoReg = 1;
						MemRead = 1;	//lw
						end
			6'b101011:  begin
						ALU = ADD;
						MemWrite = 1;
						MemtoReg = 0;	//sw
						end
			6'b001111:	begin
						ALU = ADD; 
						RegWrite = 1;	//lui
						MemtoReg = 1;
						end
			6'b000010:	begin 
						Jump = 1;	//j
						end
			6'b000011:	begin
						Jump = 1;	//jal
						end
		endcase
		end

	end
	
endmodule  