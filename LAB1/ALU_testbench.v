module ALU_testbench ();
    reg[3:0] EXE_CMD;
    reg[31:0] Val1, Val2;
    reg C;
    wire[31:0] ALU_Result;
    wire [3:0] SR;
    ALU alu(EXE_CMD, Val1, Val2, C, ALU_Result, SR);

    initial begin
        Val1 = 31'd13;
        Val2 = 31'd15;
        C = 1;
        EXE_CMD = 4'b0001; // result = Val2;
        #10;
        EXE_CMD = 4'b1001; // result = ~Val2;
        #10;
        EXE_CMD = 4'b0010; // result = Val1 + Val2;
        #10;
        EXE_CMD = 4'b0011; // result = Val1 + Val2 + C;
        #10;
        EXE_CMD = 4'b0100; // result = Val1 - Val2;
        #10;
        EXE_CMD = 4'b0101; // result = Val1 - Val2 - ~C;
        #10;
        EXE_CMD = 4'b0110; // result = Val1 & Val2;
        #10;
        EXE_CMD = 4'b0111; // result = Val1 | Val2;
        #10;
        EXE_CMD = 4'b1000; // result = Val1 ^ Val2;
        #10;
        EXE_CMD = 4'b0010; // result = Val1 + Val2;
        Val1 = 31'd4000000000;
        Val2 = 31'd4000000000;
        #10;
        $stop;
    end
endmodule