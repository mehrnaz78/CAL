module MEM_Stage(input clk, WB_EN_IN, MEM_R_EN_IN, MEM_W_EN, 
                 input [3:0] Dest_IN,
                 input [31:0] ALU_Res_IN, Val_Rm, 
                 output WB_EN, MEM_R_EN,
                 output [31:0] ALU_Res, DM_out,
                 output [3:0] Dest);
                 
  assign ALU_Res = ALU_Res_IN;
  assign Dest = Dest_IN;
  assign WB_EN = WB_EN_IN;
  assign MEM_R_EN = MEM_R_EN_IN;
  
  DataMemory DM(clk, MEM_R_EN_IN, MEM_W_EN, ALU_Res_IN, Val_Rm, DM_out);

endmodule

