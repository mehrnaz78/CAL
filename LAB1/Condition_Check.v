module ConditionCheck(input [3:0] cond, status, output reg o);
                    
always @(cond, status) begin
    case (cond)
      4'b0000: o = status[2];
      4'b0001: o = ~status[2];
      4'b0010: o = status[1];
      4'b0011: o = ~status[1];
      4'b0100: o = status[3];
      4'b0101: o = ~status[3];
      4'b0110: o = status[0];
      4'b0111: o = ~status[0];
      4'b1000: o = ~status[2] & status[1];
      4'b1001: o = status[2] | ~status[1];
      4'b1010: o = (status[3] == status[0]);
      4'b1011: o = (status[3] != status[0]);
      4'b1100: o = ~status[2] & (status[3] == status[0]);
      4'b1101: o = status[2] | (status[3] != status[0]);
      4'b1110: o = 1;
      default: o = 0;
    endcase
  end
  
endmodule