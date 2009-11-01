//ALU
//000 AND
//001 OR
//010 add
//110 sub
//111 set on less than
//2 32 bit bus in and one out

module ALU (input [3:0] operation,input [31:0] x, input [31:0] y, input [4:0] shamt, output reg [31:0] RESULT, output reg zero);
	parameter AND = 4'b0000;
	parameter OR  = 4'b0001;
	parameter ADD = 4'b0010;
	parameter SUB = 4'b0110;
	parameter SLL = 4'b0011;
	parameter SRL = 4'b0100;
	parameter SLT = 4'b0111;
	parameter SRA = 4'b0101;
	parameter NOR = 4'b1000;
always @(x,y,operation, shamt)
begin
case(operation)
	AND : RESULT = x & y;
	OR : RESULT = x | y;
	ADD : RESULT = x + y;
	NOR : RESULT = ~(x | y);
	SLL : RESULT = x << shamt;
	SRL : RESULT = x >> shamt;
	SUB : RESULT = x - y;
	
	SLT : 
		begin
			if ((x - y)>0)
			zero=1'b1;
			else
			zero=1'b0;
		end
	SRA : RESULT = x>>>shamt;
	default;
endcase
	zero = RESULT[0];
end
endmodule
