module PC_Reg(
	input clk,
	input rst,
	input freeze,
	input[31:0] PC_in,
	output reg [31:0] PC
);
	always @(posedge clk, posedge rst) begin
		if (rst == 1) PC <= 32'b0;
		else begin
		  if (freeze == 0) PC <= PC_in;
		  else PC <= PC;
		 end
	end
endmodule