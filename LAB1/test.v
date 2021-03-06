`timescale 1ns/1ns
module testbench();
  reg clk , rst, mode;
  integer i;
  ARM arm(clk, rst, mode);
  initial begin
    mode = 1;
    clk =0;
    rst = 0;
    #500;
    rst = 1;
    #500;
    rst = 0;
    #500
    for (i = 0; i<500; i = i + 1)begin
      clk = ~clk;
      #200;
    end
    $stop;
  end
      
endmodule