module Hazard_Detection_Unit (
    input [4:0] src1, src2, 
    input [4:0] Exe_Dest,
    input Exe_WB_EN,
    input [4:0] Mem_Dest,
    input Mem_WB_EN,
    input two_source,
    output Hazard_Detected
);
    assign Hazard_Detected = ((src1 == Exe_Dest) & Exe_WB_EN) | 
                             ((src1 == Mem_Dest) & Mem_WB_EN) | 
                             (two_source & (src2 == Exe_Dest) & Exe_WB_EN) | 
                             (two_source & (src2 == Mem_Dest) & Mem_WB_EN);
endmodule