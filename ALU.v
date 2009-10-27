//ALU
//000 AND
//001 OR
//010 add
//110 sub
//111 set on less than
//2 32 bit bus in and one out

module ALU (input [2:0] operation,input [31:0] x, input [31:0] y, input shamt, output reg [31:0] RESULT, output reg zero);
//reg [31:0] RESULT; 
//assign RES = RESULT;
always @(x,y,operation)
begin
case(operation)
	3'b000 : RESULT = x & y;
	3'b001 : RESULT = x | y;
	3'b010 : RESULT = x + y;
	3'b011 : RESULT = ~(x | y);
	3'b100 : RESULT = x << shamt;
	3'b101 : RESULT = x >> shamt;
	3'b110 : RESULT = x - y;
	
	
	
	3'b111 : 
		begin
			if ((x - y)>0)
			zero=1'b1;
			else
			zero=1'b0;
		end
	default;
endcase
end
endmodule
