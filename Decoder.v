module Decoder(

    input [31:0] instruction,

    output [5:0] opcode,
    output [4:0] rs1,
    output [4:0] rs2,
    output [4:0] rd

);

assign opcode = instruction[31:26];
assign rs1    = instruction[25:21];
assign rs2    = instruction[20:16];
assign rd     = instruction[15:11];

endmodule