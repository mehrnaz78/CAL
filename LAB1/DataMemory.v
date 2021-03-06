module DataMemory(input clk, MEM_R_EN, MEM_W_EN, 
                 input [31:0] ALU_Res, Val_Rm, 
                 output [31:0] DM_out);
                 
    reg [31:0] memory [0:63];
    wire [31:0] addr;
    assign addr = (ALU_Res - 32'd1024) >> 2;
    
    always @(posedge clk) begin
      if (MEM_W_EN) memory[addr[5:0]] <= Val_Rm;
    end  
    
    assign DM_out = (MEM_R_EN) ? memory[addr[5:0]]:32'b0;

endmodule