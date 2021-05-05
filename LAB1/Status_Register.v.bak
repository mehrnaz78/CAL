module Status_Register (
    input clk, rst,
    input [3:0] Status_bits_in,
    output reg [3:0] Status_bits,
);
    always @(posedge clk, posedge rst) begin
        if (rst) Status_bits <= 4'b0;
        else Status_bits <= Status_bits_in;
    end
endmodule