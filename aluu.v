`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2026 23:05:28
// Design Name: 
// Module Name: aluu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module aluu (

    input [31:0] A,
    input [31:0] B,
    input [2:0] sel,

    output reg [31:0] Y

);

always @(*) begin

    case(sel)

        3'b000: Y = A + B;   // Addition

        3'b001: Y = A - B;   // Subtraction

        3'b010: Y = A & B;   // AND

        3'b011: Y = A | B;   // OR

        3'b100: Y = A ^ B;   // XOR

        default: Y = 32'b0;

    endcase

end

endmodule