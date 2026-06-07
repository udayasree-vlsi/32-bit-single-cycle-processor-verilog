`timescale 1ns / 1ps

module PC_tb;

reg clk;
reg reset;

wire [31:0] pc_out;

PC uut (
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #100;

    $finish;
end

initial
begin
    $monitor("Time = %0t | Reset = %b | PC = %d",
              $time, reset, pc_out);
end

endmodule