module ConditionCheck(input [3:0] cond, status, output o);
                    
  assign o = ((cond == 4'b1110) | (cond == status))?1:0;

endmodule