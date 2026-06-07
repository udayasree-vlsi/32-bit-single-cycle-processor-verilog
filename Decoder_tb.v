`timescale 1ns / 1ps

module Decoder_tb;

reg [31:0] instruction;

wire [5:0] opcode;
wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;

Decoder uut(

    .instruction(instruction),
    .opcode(opcode),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd)

);

initial begin

    instruction =
    32'b000000_00010_00011_00001_00000000000;

    #10;

    $stop;

end

endmodule