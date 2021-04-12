module IF_Stage(input clk, rst, freeze, Branch_taken,
                input[31:0] BranchAddr,
                output[31:0] PC, Instruction);
                
    wire [31:0] mux_output;
    wire [31:0] PC_output;
    assign mux_output = (Branch_taken == 1) ? BranchAddr:PC;
    PC_Reg pc_reg(clk, rst, freeze, mux_output, PC_output);
    assign PC = PC_output + 4;
    instructionMemory inst(PC_output, Instruction);
endmodule