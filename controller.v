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
	parameter SLT = 3'b111;
	
	
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
	
	if (op == 0)
		begin
		case(func)
			6'b100000:	ALU = ADD; 	//add
			6'b100001:	ALU = ADD;	//addu
			6'b100010:	ALU = SUB;	//sub
			6'b100011:	ALU = SUB; 	//subu
			6'b100100:	ALU = AND;	//and
			6'b100101:	ALU = OR ;   //or
			6'b100111:	ALU = OR;	//nor
			6'b101010:	ALU = SLT;	//slt
			6'b000000:	ALU = SLT; 	//sll
			6'b000010:	ALU = SLT; 	//srl
			6'b000011:	ALU = SLT;	//sra
			6'b001000: Jump = 1;	//jr
			6'b000000:	begin 
						MemWrite = 0;//nop
						RegWrite = 0;
						end
		endcase
		end
	else
		begin
		case (op)
			6'b001100:	ALU = AND;	//andi
			6'b001101:	ALU = OR;	//ori
			6'b001010:	ALU = SLT;	//slti
			6'b001000:	ALU = ADD;	//addi
			6'b001001:	ALU = SUB;	//subi
			6'b000100:	if (zero) 
							begin 
							Branch = 1;	//beq
							end
			6'b000101:	if (!zero)
							begin
							Branch = 1;	//bne
							end
			6'b100011:	begin
						MemtoReg = 1;
						MemWrite = 1;//lw
						end
			6'b101011:  begin
						MemWrite = 1;
						MemtoReg = 0;		//sw
						end
			
			6'b001111:	RegWrite = 1;	//lui
			6'b000010:	Jump = 1;	//j
			6'b000011:	Jump = 1;	//jal
		endcase
		end

	end
	
	
endmodule  