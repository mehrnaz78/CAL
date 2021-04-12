`timescale 1ns/1ns
module testbench();
  reg clk , rst;
  integer i;
  ARM arm(clk, rst);
  initial begin
    clk =0;
    rst = 0;
    #500;
    rst = 1;
    #500;
    rst = 0;
    #500
    for (i = 0; i<50; i = i + 1)begin
      clk = ~clk;
      #10000;
    end
    $stop;
  end
      
endmodule