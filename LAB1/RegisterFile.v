module RegisterFile(input clk, rst,
                    input [3:0] src1, src2, Dest_wb,
                    input  [31:0] Result_WB,
                    input writeBackEn,
                    output [31:0] out1, out2);
                    
  integer i;
  reg [31:0] registers[14:0];
  initial begin  
    for(i=0; i<=14; i=i+1) begin
      registers[i] = i;
    end  
  end  
  
  assign out1 = registers[src1];
  assign out2 = registers[src2];
  
  always @(negedge clk) begin
      if(writeBackEn) registers[Dest_wb] <= Result_WB;
  end
endmodule