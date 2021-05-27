module ARM(input clk, rst, mode);
  wire freeze, flush, branch_taken;
  wire [31:0] if_pc, inst, id_pc, exe_pc, mem_pc, wb_pc, branch_addr;
  wire [31:0] if_pc_reg, inst_reg, id_reg_pc, exe_reg_pc, mem_reg_pc, wb_reg_pc;
  
  wire writeBackEn, Dest_wb, Hazard, WB_EN, MEM_R_EN, MEM_W_EN, B, S, imm, Two_src;
  wire [31:0] Result_WB, Val_Rn, Val_Rm;
  wire [3:0] SR, EXE_CMD, Dest, src1, src2;
  wire [11:0] Shift_operand;
  wire [23:0] Signed_imm_24;
  
  wire WB_EN_reg, MEM_R_EN_reg, MEM_W_EN_reg, B_reg, S_reg, imm_reg;
  wire [31:0] Val_Rn_reg, Val_Rm_reg;
  wire [3:0] EXE_CMD_reg, Dest_reg;
  wire [11:0] Shift_operand_reg;
  wire [23:0] Signed_imm_24_reg;

  wire exe_reg_WB_EN, exe_reg_MEM_R_EN, exe_reg_MEM_W_EN;
  wire [31:0] exe_reg_ALU_Result, exe_reg_Val_Rm;
  wire [3:0] exe_reg_Dest;

  wire [31:0] exe_ALU_Res;
  wire [3:0]exe_Status_bits;
  
  wire mem_WB_EN, mem_MEM_R_EN;
  wire [31:0] mem_ALU_Res, mem_DM_out;
  wire [3:0] mem_Dest;

  wire mem_reg_WB_EN, mem_reg_MEM_R_EN;
  wire [31:0] mem_reg_ALU_Res, mem_reg_DM_out;
  wire [3:0] mem_reg_Dest;
   
  wire [3:0] src1_reg, src2_reg;
  wire [1:0] sel_src1, sel_src2;
  wire [1:0] sel1, sel2;
  wire [31:0] exe_val_Rm;
  wire Hazard_detected;
  wire carry;
  wire [31:0] mem_forward_data;
  
  assign Hazard = Hazard_detected & (~mode);
  assign freeze = Hazard;
  assign flush = branch_taken;
  assign sel_src1 = (mode)?sel1:2'b0;
  assign sel_src2 = (mode)?sel2:2'b0;
  

  IF_Stage IF_Stage_(clk, rst, freeze, branch_taken, branch_addr, if_pc, inst);
  IF_Stage_Reg IF_Stage_Reg_(clk, rst, freeze, flush, if_pc, inst, if_pc_reg, inst_reg);
  
  ID_Stage ID_Stage_(clk, rst, inst_reg, Result_WB, mem_reg_WB_EN, mem_reg_Dest, Hazard, SR,
                      WB_EN, MEM_R_EN, MEM_W_EN, B, S, EXE_CMD, Val_Rn, Val_Rm, 
                      imm, Shift_operand, Signed_imm_24, Dest, src1, src2, Two_src);
  ID_Stage_Reg ID_Stage_Reg_(clk, rst, flush, WB_EN, MEM_R_EN, MEM_W_EN, B, S, EXE_CMD, 
                              if_pc_reg, Val_Rn, Val_Rm, imm, Shift_operand, Signed_imm_24, Dest, src1, src2, SR[1],
                              WB_EN_reg, MEM_R_EN_reg, MEM_W_EN_reg, branch_taken, S_reg,
                              EXE_CMD_reg, id_reg_pc, Val_Rn_reg, Val_Rm_reg, imm_reg,                
                              Shift_operand_reg, Signed_imm_24_reg, Dest_reg, src1_reg, src2_reg, carry);
  
  EXE_Stage EXE_Stage_(clk, EXE_CMD_reg, sel_src1, sel_src2, MEM_R_EN_reg, MEM_W_EN_reg, id_reg_pc, Val_Rn_reg, Val_Rm_reg, mem_forward_data, Result_WB, imm_reg, Shift_operand_reg, Signed_imm_24_reg, carry,
                       exe_ALU_Res, branch_addr, exe_val_Rm, exe_Status_bits);
  EXE_Stage_Reg EXE_Stage_Reg_(clk, rst, WB_EN_reg, MEM_R_EN_reg, MEM_W_EN_reg, exe_ALU_Res, exe_val_Rm, Dest_reg, 
                               exe_reg_WB_EN, exe_reg_MEM_R_EN, exe_reg_MEM_W_EN, exe_reg_ALU_Result, exe_reg_Val_Rm, exe_reg_Dest);

  Status_Register Status_Register_(clk, rst, exe_Status_bits, S_reg, 
                                   SR);
  
  MEM_Stage MEM_Stage_(clk, exe_reg_WB_EN, exe_reg_MEM_R_EN, exe_reg_MEM_W_EN, 
                        exe_reg_Dest, exe_reg_ALU_Result, exe_reg_Val_Rm, 
                        mem_WB_EN, mem_MEM_R_EN, mem_ALU_Res, mem_DM_out, mem_Dest, mem_forward_data);
  MEM_Stage_Reg MEM_Stage_Reg_(clk, rst, mem_WB_EN, mem_MEM_R_EN, mem_ALU_Res, mem_DM_out, mem_Dest,
                              mem_reg_WB_EN, mem_reg_MEM_R_EN, mem_reg_Dest, mem_reg_ALU_Res, mem_reg_DM_out);
  
  WB_Stage WB_Stage_(mem_reg_ALU_Res, mem_reg_DM_out, mem_reg_MEM_R_EN, Result_WB);

  Hazard_Detection_Unit Hazard_Detection_Unit_(src1, src2, Dest_reg, WB_EN_reg, exe_reg_Dest, exe_reg_WB_EN, Two_src, Hazard_detected);

  Forwarding_Unit Forwarding_Unit_(mem_reg_WB_EN, exe_reg_WB_EN,
    				mem_reg_Dest, exe_reg_Dest, src1_reg, src2_reg, 
				sel1, sel2);
endmodule