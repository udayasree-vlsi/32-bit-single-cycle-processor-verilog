module Processor(
    input clk,
    input reset
);
wire [31:0] pc_out;
wire [31:0] instruction;
wire [5:0] opcode;
wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;
wire reg_write;
wire mem_read;
wire mem_write;
wire alu_src;
wire [1:0] alu_op;
wire [2:0] alu_sel;
wire [31:0] read_data1;
wire [31:0] read_data2;
wire [31:0] alu_result;
wire [31:0] alu_result;
wire [31:0] mem_data;
assign alu_sel = {1'b0, alu_op};
// PC
PC pc1(
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out)
);
// Instruction Memory
InstructionMemory imem(
    .addr(pc_out),
    .instruction(instruction)
);
Decoder dec(
    .instruction(instruction),
    .opcode(opcode),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd)
);
control_unit cu(
    .opcode(opcode),
    .reg_write(reg_write),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_src(alu_src),
    .alu_op(alu_op)
);
RegisterFile rf(
    .clk(clk),
    .RegWrite(reg_write),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(alu_result),
    .read_data1(read_data1),
    .read_data2(read_data2)
);
aluu alu1(
    .A(read_data1),
    .B(read_data2),
    .sel(alu_sel),
    .Y(alu_result)
);
DataMemory dm(
    .clk(clk),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .address(alu_result),
    .write_data(read_data2),
    .read_data(mem_data)
);
endmodule