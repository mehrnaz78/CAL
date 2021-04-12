module instructionMemory(input [31:0]pc , output [31:0] instruction);    
      reg [31:0] instruction_mem[6:0];  
      initial begin  
        instruction_mem[0] = 32'b00000000001000100000000000000000;
        instruction_mem[1] = 32'b00000000011001000000000000000000;
        instruction_mem[2] = 32'b00000000101001100000000000000000;
        instruction_mem[3] = 32'b00000000111010000001000000000000;
        instruction_mem[4] = 32'b00000001001010100001100000000000;
        instruction_mem[5] = 32'b00000001011011000000000000000000;
        instruction_mem[6] = 32'b00000001101011100000000000000000;      
      end  
      assign instruction = (pc[31:2] < 7) ? instruction_mem[pc[31:2]] : 32'b0;
 endmodule   