module DataMemory(

    input clk,
    input mem_read,
    input mem_write,

    input [31:0] address,
    input [31:0] write_data,

    output reg [31:0] read_data

);

reg [31:0] memory [0:255];

initial begin

    memory[0] = 32'd100;
    memory[1] = 32'd200;
    memory[2] = 32'd300;
    memory[3] = 32'd400;

end

always @(*) begin

    if(mem_read)
        read_data = memory[address[7:0]];
    else
        read_data = 32'd0;

end

always @(posedge clk) begin

    if(mem_write)
        memory[address[7:0]] <= write_data;

end


endmodule
