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
wire [5:0] funct;

wire reg_write;
wire mem_read;
wire mem_write;
wire alu_src;

wire [1:0] alu_op;
wire [2:0] alu_sel;

wire [31:0] read_data1;
wire [31:0] read_data2;

wire [31:0] alu_result;
wire [31:0] mem_data;

wire [31:0] write_back_data;

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

// Decoder
Decoder dec(
    .instruction(instruction),
    .opcode(opcode),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .funct(funct)
);

// Control Unit
control_unit cu(
    .opcode(opcode),
    .reg_write(reg_write),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_src(alu_src),
    .alu_op(alu_op)
);

// ALU Control
ALU_Control alu_ctrl(
    .alu_op(alu_op),
    .funct(funct),
    .alu_sel(alu_sel)
);

// Write Back MUX
assign write_back_data =
       (mem_read) ? mem_data : alu_result;

// Register File
RegisterFile rf(
    .clk(clk),
    .RegWrite(reg_write),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(write_back_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

// ALU
aluu alu1(
    .A(read_data1),
    .B(read_data2),
    .sel(alu_sel),
    .Y(alu_result)
);

// Data Memory
DataMemory dm(
    .clk(clk),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .address(alu_result),
    .write_data(read_data2),
    .read_data(mem_data)
);
    
endmodule
