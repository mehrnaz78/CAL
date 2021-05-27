module Forwarding_Unit (
    input WB_WB_EN, MEM_WB_EN,
    input [3:0] WB_Dest, MEM_Dest, EXE_src1, EXE_src2,
    output [1:0] Sel_src1, Sel_src2);
    
    assign Sel_src1 = ((MEM_Dest == EXE_src1) && (MEM_WB_EN == 1'b1)) ? 2'b01 :
                        (((WB_Dest == EXE_src1) && (WB_WB_EN == 1'b1)) ? 2'b10 : 2'b0);
    assign Sel_src2 = ((MEM_Dest == EXE_src2) && (MEM_WB_EN == 1'b1)) ? 2'b01 :
                        (((WB_Dest == EXE_src2) && (WB_WB_EN == 1'b1)) ? 2'b10 : 2'b0);

endmodule