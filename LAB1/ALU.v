module ALU (
    input [3:0] EXE_CMD,
    input [31:0] Val1, Val2,
    input C,
    output [31:0] ALU_Result,
    output [3:0] SR
);
    reg [32:0] result;
    always @(EXE_CMD, Val1, Val2) begin
        case (EXE_CMD)
            4'b0001: result = Val2;
            4'b1001: result = ~Val2;
            4'b0010: result = Val1 + Val2;
            4'b0011: result = Val1 + Val2 + C;
            4'b0100: result = Val1 - Val2;
            4'b0101: result = Val1 - Val2 - {31'b0, ~C};
            4'b0110: result = Val1 & Val2;
            4'b0111: result = Val1 | Val2;
            4'b1000: result = Val1 ^ Val2;
            default: result = 4'bXXXX;
        endcase
    end
    assign SR[0] = (EXE_CMD == 4'b0100 || EXE_CMD == 4'b0101) ? 
    					(((~result[31])&Val1[31]&(~Val2[31])) | (result[31]&(~Val1[31])&Val2[31]))
    					: 
    		       		((EXE_CMD == 4'b0010 || EXE_CMD == 4'b0011) ? 
    		       			(((~result[31])&Val1[31]&Val2[31]) | (result[31]&(~Val1[31])&(~Val2[31])))
    		       			:
    		       			0);
    assign SR[1] = (EXE_CMD == 4'b0100 || EXE_CMD == 4'b0101 || EXE_CMD == 4'b0010 || EXE_CMD == 4'b0011) ? result[32] : 0;
    assign SR[2] = ~(|result);
    assign SR[3] = result[31];
    assign ALU_Result = result[31:0];
endmodule
