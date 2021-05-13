module Val2_Generator (
    input imm,
    input [11:0] Shift_operand,
    input [31:0] Rm_Val,
    input MEM_EN,
    output reg [31:0] Val2
);
    wire [39:0] rotation_temp = { Shift_operand[7:0], 24'b0, Shift_operand[7:0] };
    wire [39:0] rotated = (rotation_temp >> Shift_operand[11:8]) >> Shift_operand[11:8];
    wire [63:0] Rm_rotation_temp = { Rm_Val, Rm_Val };
    wire [63:0] Rm_rotated = (Rm_rotation_temp >> Shift_operand[11:7]);

    always @(*) begin
        if (MEM_EN) Val2 = { {20{Shift_operand[11]}}, Shift_operand[11:0] };
        else if (imm) Val2 = rotated[31:0];
        else 
            case (Shift_operand[6:5])
                2'b00: Val2 = Rm_Val << Shift_operand[11:7];
                2'b01: Val2 = Rm_Val >> Shift_operand[11:7];
                2'b10: Val2 = Rm_Val >> Shift_operand[11:7];
                2'b11: Val2 = Rm_rotated[31:0];
                default: Val2 = 32'bX;
            endcase
    end
    

endmodule

