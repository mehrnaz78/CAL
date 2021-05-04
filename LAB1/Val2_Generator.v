module Val2_Generator (
    input imm,
    input [11:0] Shift_operand,
    input [31:0] Rm_Val,
    input [3:0] EXE,
    output [31:0] Val2
);
    wire [39:0] rotation_temp = { Shift_operand[7:0], 24'b0, Shift_operand[7:0]}
    assign Val2 = (imm == 1) ? (rotation_temp >> Shift_operand[11:8])[31:0] :
                                32'b0;

endmodule

