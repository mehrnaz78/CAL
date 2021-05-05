module WB_Stage(
  input[31:0] ALU_Result, MEM_Result, 
  input MEM_R_EN, 
  output[31:0] out
);
  assign out = MEM_R_EN ? MEM_Result : ALU_Result;
endmodule