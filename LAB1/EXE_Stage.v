module EXE_Stage(
  input clk,
  input [3:0] EXE_CMD,
  input MEM_R_EN, MEM_W_EN,
  input [31:0] PC,
  input [31:0] Val_Rn, Val_Rm, 
  input imm,
  input [11:0] Shift_operand,
  input [23:0] Signed_imm_24,
  input [3:0] SR,
  output [31:0] ALU_res, Branch_Address,
  output [3:0] Status_bits
);
  wire [31:0] Signed_EX_imm24, Val2;
  wire MEM_EN;
  assign Signed_EX_imm24 = { {8{Signed_imm_24[23]}}, Signed_imm_24[23:0] };

  assign Branch_Address = (Signed_EX_imm24 << 2) + PC;

  assign MEM_EN = MEM_R_EN | MEM_W_EN;

  Val2_Generator Val2_Generator_(imm, Shift_operand, Val_Rm, MEM_EN, Val2);
  ALU alu(EXE_CMD, Val_Rn, Val2, SR[1], ALU_res, Status_bits);
endmodule
