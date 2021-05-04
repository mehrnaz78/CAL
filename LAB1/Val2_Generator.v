module Val2_Generator (
    input imm,
    input [11:0] Shift_operand,
    input [31:0] Rm_Val,
    input MEM_EN,
    output reg [31:0] Val2
);
    wire [39:0] rotation_temp = { Shift_operand[7:0], 24'b0, Shift_operand[7:0]};
    wire [39:0] rotated = (rotation_temp >> Shift_operand[11:8]);

    always @(*) begin
        if (imm) Val2 = rotated[31:0];
        else 
            case (Shift_operand[6:5])
                2'b00: Val2 = Rm_Val << Shift_operand[11:7];
                2'b01: Val2 = Rm_Val >> Shift_operand[11:7];
                2'b10: Val2 = Rm_Val >>> Shift_operand[11:7];
                2'b11: Val2 = {Rm_Val[Shift_operand[11:7]-1:0], Rm_Val[31:Shift_operand[11:7]]};;
                default: Val2 = 32'bX;
            endcase
    end
    

endmodule

