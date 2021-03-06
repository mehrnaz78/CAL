module Status_Register (
    input clk, rst,
    input [3:0] Status_bits_in,
    input S,
    output reg [3:0] Status_bits
);
    always @(negedge clk, posedge rst) begin
        if (rst) Status_bits <= 4'b1110;
        else if (S) Status_bits <= Status_bits_in;
        else Status_bits <= Status_bits;
    end
endmodule