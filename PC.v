`timescale 1ns / 1ps


module PC (
    input clk,
    input reset,
    output reg [31:0] pc_out
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        pc_out <= 0;
    else if(pc_out < 32'd28)
        pc_out <= pc_out + 4;
end

endmodule
