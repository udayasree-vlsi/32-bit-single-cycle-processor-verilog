module InstructionMemory(

    input [31:0] addr,
    output [31:0] instruction

);

reg [31:0] memory [0:255];

initial begin

    memory[0] = 32'h00430820; // ADD
    memory[1] = 32'h00430822; // SUB
    memory[2] = 32'h00430824; // AND
    memory[3] = 32'h00430825; // OR
    memory[4] = 32'h00430826; // XOR
    memory[5] = 32'h0043082A; // SLT
    memory[6] = 32'h8C010000; // LW
    memory[7] = 32'hAC010004; // SW

end

assign instruction = memory[addr[9:2]];

endmodule
