`timescale 1ns/1ps

module Processor_tb;

reg clk;
reg reset;

Processor uut(
    .clk(clk),
    .reset(reset)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

   #40;
   $stop;

end


endmodule