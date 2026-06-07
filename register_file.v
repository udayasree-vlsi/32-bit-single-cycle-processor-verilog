module RegisterFile(

    input clk,
    input RegWrite,

    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,

    input [31:0] write_data,

    output [31:0] read_data1,
    output [31:0] read_data2

);

reg [31:0] registers [31:0];

// Read operation
assign read_data1 = registers[rs1];
assign read_data2 = registers[rs2];

// Write operation
always @(posedge clk) begin

    if(RegWrite)
        registers[rd] <= write_data;

end
integer i;

initial begin
    for(i=0;i<32;i=i+1)
        registers[i] = 0;

    registers[2] = 15;
    registers[3] = 25;
end

endmodule