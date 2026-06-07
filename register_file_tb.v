`timescale 1ns / 1ps
module RegisterFile_tb;
reg clk;
reg RegWrite;
reg [4:0] rs1;
reg [4:0] rs2;
reg [4:0] rd;
reg [31:0] write_data;
wire [31:0] read_data1;
wire [31:0] read_data2;
RegisterFile uut(
    .clk(clk),
    .RegWrite(RegWrite),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);
always #5 clk = ~clk;
initial begin
    clk = 0;
    RegWrite = 1;
    rd = 5'd1;
    write_data = 32'd15;
    #10;
    rd = 5'd2;
    write_data = 32'd25;
    #10;
    RegWrite = 0;
    rs1 = 5'd1;
    rs2 = 5'd2;
    #10;
    $stop;
end
endmodule