//ALU
//000 AND
//001 OR
//010 add
//110 sub
//111 set on less than
//2 32 bit bus in and one out

module ALU (input [3:0] operation,input [31:0] x, input [31:0] y, input [4:0] shamt, output reg [31:0] RESULT, output reg zero);

always @(x,y,operation, shamt)
begin
case(operation)
	4'b0000 : RESULT = x & y;
	4'b0001 : RESULT = x | y;
	4'b0010 : RESULT = x + y;
	4'b0011 : RESULT = ~(x | y);
	4'b0100 : RESULT = x << shamt;
	4'b0101 : RESULT = x >> shamt;
	4'b0110 : RESULT = x - y;
	
	4'b0111 : 
		begin
			if ((x - y)>0)
			zero=1'b1;
			else
			zero=1'b0;
		end
	4'b1000 : RESULT = x>>>shamt;
	default;
endcase
end
endmodule
