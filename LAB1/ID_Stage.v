module ID_Stage(input clk, rst, 
                input[31:0] inst, 
                input [31:0] Result_WB,
                input writeBackEn,
                input [3:0] Dest_wb,
                input hazard,
                input [3:0] SR,
                
                output WB_EN, MEM_R_EN, MEM_W_EN, B, S,
                output [3:0] EXE_CMD,
                output[31:0] Val_Rn, Val_Rm,
                output imm,
                output [11:0] Shift_operand,
                output [23:0] Signed_imm_24,
                output [3:0] Dest,
                output [3:0] src1, src2,
                output Two_src);
    
  wire o, or_out, WB_EN_c_out, MEM_R_EN_c_out, MEM_W_EN_c_out;
  wire B_c_out, S__c_out;
  wire [3:0] EXE_CMD_c_out;
  
  assign or_out = (~o)|(hazard);
  assign WB_EN = (or_out == 0)?WB_EN_c_out:0;
  assign MEM_R_EN = (or_out == 0)?MEM_R_EN_c_out:0;
  assign MEM_W_EN = (or_out == 0)?MEM_W_EN_c_out:0;
  assign B = (or_out == 0)?B_c_out:0;
  assign S = (or_out == 0)?S__c_out:0;
  assign EXE_CMD = (or_out == 0)?EXE_CMD_c_out:0;
  assign Signed_imm_24 = inst[23:0];
  assign Shift_operand = inst[11:0];
  assign imm = inst[25];
  assign Two_src = (~imm)|(MEM_W_EN);
  assign src1 = ((inst[24:21] == 4'b1101) | (inst[24:21] == 4'b1111))?4'b1111:inst[19:16];
  assign src2 = (MEM_W_EN)?inst[15:12]:inst[3:0];
  assign Dest = inst[15:12];
  RegisterFile register_file(clk, rst, inst[19:16], src2, 
                    Dest_wb, Result_WB, writeBackEn, Val_Rn, Val_Rm);

  ControlUnit control_unit(inst[20], inst[27:26], inst[24:21],
                    WB_EN_c_out, MEM_R_EN_c_out, MEM_W_EN_c_out, 
                    B_c_out, S__c_out, EXE_CMD_c_out);

  ConditionCheck condition_check(inst[31:28], SR, o);

  
endmodule