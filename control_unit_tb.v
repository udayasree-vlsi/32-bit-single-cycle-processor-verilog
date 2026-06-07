module control_unit_tb;

reg [5:0] opcode;

wire reg_write;
wire mem_read;
wire mem_write;
wire alu_src;
wire [1:0] alu_op;

control_unit uut(
    .opcode(opcode),
    .reg_write(reg_write),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_src(alu_src),
    .alu_op(alu_op)
);

initial begin

    opcode = 6'b000000;
    #10;

    opcode = 6'b100011;
    #10;

    opcode = 6'b101011;
    #10;

    opcode = 6'b111111;
    #10;
    $finish;
end

endmodule
