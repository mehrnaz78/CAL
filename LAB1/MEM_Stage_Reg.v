module MEM_Stage_Reg(input clk, rst, WB_EN_IN, MEM_R_EN_IN, 
                    input[31:0] ALU_Res_IN, DM_IN,
                    input [3:0] Dest_IN,
                    output reg WB_EN, MEM_R_EN,
                    output reg [3:0] Dest,
                    output reg[31:0] ALU_Res, DM);
    always @(posedge clk, posedge rst) begin
      if(rst) begin
       WB_EN <= 1'b0;
       MEM_R_EN <= 1'b0;
       Dest <= 4'b0;
       ALU_Res <= 32'b0;
       DM <= 32'b0;
      end
      else begin
       WB_EN <= WB_EN_IN;
       MEM_R_EN <= MEM_R_EN_IN;
       Dest <= Dest_IN;
       ALU_Res <= ALU_Res_IN;
       DM <= DM_IN;
      end
    end
endmodule