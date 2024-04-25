module ProgramMemory(
    input [7:0] address,
    output reg [7:0] instruction,
    input clk
);

    reg [7:0] memory [255:0];
    wire [7:0] instruction_wire;

    // Instantiate memory units
    MemoryUnit mem_unit(
        .address(address),
        .data_out(instruction_wire)
    );
	 always @(posedge clk) begin
        instruction <= instruction_wire;
    end

endmodule

module MemoryUnit(
    input [7:0] address,
    output reg [7:0] data_out
);
	 reg [7:0] memory [255:0];

    // Initialize memory with instructions
    initial begin
        memory[0] = 8'b00000000; // NOP
        memory[1] = 8'b00010001; // addi $1 = $2 + 10
        memory[2] = 8'b00100010; // beq if ($1 == $2) go to 6
        memory[3] = 8'b00110011; // j go to 25
    end
	 
	 always @(address) begin
    data_out <= memory[address];
end

endmodule
