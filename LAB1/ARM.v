module ARM(input clk, rst);
  wire freeze, branchTaken;
  wire [31:0] if_pc, inst, id_pc, exe_pc, mem_pc, wb_pc, branch_addr;
  wire [31:0] if_pc_reg, inst_reg, id_reg_pc, exe_reg_pc, mem_reg_pc, wb_reg_pc;

  assign freeze = 1'b0;
  assign branch_taken = 1'b0;
  assign branch_addr = 32'b0;

  IF_Stage IF_Stage_(clk, rst, freeze, branch_taken, branch_addr, if_pc, inst);
  IF_Stage_Reg IF_Stage_Reg_(clk, rst, freeze, flush, if_pc, inst, if_pc_reg, inst_reg);
  
  ID_Stage ID_Stage_(clk, rst, if_pc_reg, id_pc);
  ID_Stage_Reg ID_Stage_Reg_(clk, rst, id_pc, id_reg_pc);
  
  EXE_Stage EXE_Stage_(clk, rst, id_reg_pc, exe_pc);
  EXE_Stage_Reg EXE_Stage_Reg_(clk, rst, exe_pc, exe_reg_pc);
  
  MEM_Stage MEM_Stage_(clk, rst, exe_reg_pc, mem_pc);
  MEM_Stage_Reg MEM_Stage_Reg_(clk, rst, mem_pc, mem_reg_pc);
  
  WB_Stage WB_Stage_(clk, rst, mem_reg_pc, wb_pc);
  WB_Stage_Reg WB_Stage_Reg_(clk, rst, wb_pc, wb_reg_pc);
endmodule
