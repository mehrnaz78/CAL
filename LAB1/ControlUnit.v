module ControlUnit(input S,
                    input [1:0] mode,
                    input  [3:0] Op_code,
                    output reg WB_EN, MEM_R_EN, MEM_W_EN, B, out_S,
                    output reg [3:0] EXE_CMD);
                    
  always @(mode, Op_code, S)begin
    WB_EN = 1'b1;
    case(mode)
      2'b00: begin
        B = 1'b0;
        MEM_R_EN = 1'b0;
        MEM_W_EN = 1'b0;
        out_S = S;
        case(Op_code)
          4'b1101: EXE_CMD = 4'b0001;
          4'b1111: EXE_CMD = 4'b1001;
          4'b0100: EXE_CMD = 4'b0010;
          4'b0101: EXE_CMD = 4'b0011;
          4'b0010: EXE_CMD = 4'b0100;
          4'b0110: EXE_CMD = 4'b0101;
          4'b0000: EXE_CMD = 4'b0110;
          4'b1100: EXE_CMD = 4'b0111;
          4'b0001: EXE_CMD = 4'b1000;
          4'b1010: begin
            EXE_CMD = 4'b0100;
            WB_EN = 1'b0;
          end
          4'b1000: begin
            EXE_CMD = 4'b0110;
            WB_EN = 1'b0;
          end
          
        endcase
      end
      
      2'b01: begin
        B = 1'b0;        
        EXE_CMD = 4'b0010;
        case(S)
          1'b0:  begin
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b1;
            WB_EN = 1'b0;
            out_S = 1'b0;
          end
          1'b1: begin
            MEM_R_EN = 1'b1;
            MEM_W_EN = 1'b0;
            out_S = 1'b1;
          end
        endcase
      end
      
      2'b10: begin
        B = 1'b1;
        out_S = 1'b0;
        MEM_R_EN = 1'b0;
        MEM_W_EN = 1'b0;
        EXE_CMD = 4'bxxxx;
      end
      
    endcase
  end  
endmodule