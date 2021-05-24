module EXE_Stage(
  input clk,
  input [3:0] EXE_CMD,
  input [1:0] sel_src1, sel_src2,
  input MEM_R_EN, MEM_W_EN,
  input [31:0] PC,
  input [31:0] Val_Rn, Val_Rm_IN, 
  input [31:0] ALU_res_MEM, WB_value,
  input imm,
  input [11:0] Shift_operand,
  input [23:0] Signed_imm_24,
  input carry,
  output [31:0] ALU_res, Branch_Address, Val_Rm,
  output [3:0] Status_bits
);
  wire [31:0] Signed_EX_imm24, Val2, Val1;
  wire MEM_EN;
  assign Signed_EX_imm24 = { {8{Signed_imm_24[23]}}, Signed_imm_24[23:0] };

  assign Branch_Address = (Signed_EX_imm24 << 2) + PC;

  assign MEM_EN = MEM_R_EN | MEM_W_EN;

  assign Val_Rm = (sel_src2 == 2'b00)? Val_Rm_IN: ((sel_src2 == 2'b01)?ALU_res_MEM:WB_value);

  assign Val1 = (sel_src1 == 2'b00)? Val_Rn: ((sel_src1 == 2'b01)?ALU_res_MEM:WB_value);

  Val2_Generator Val2_Generator_(imm, Shift_operand, Val_Rm, MEM_EN, Val2);
  ALU alu(EXE_CMD, Val1, Val2, carry, ALU_res, Status_bits);
endmodule
