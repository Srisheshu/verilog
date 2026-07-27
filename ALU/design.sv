// Code your design here

`timescale 1ns / 1ps

module alu_8bit (
    input  [7:0] a, b,       
    input  [2:0] sel,    
    output reg [7:0] result, 
    output zero              
);

    assign zero = (result == 8'b0);

    always @(*) begin
        case(sel)
            3'b000: result = a + b;       // Addition
            3'b001: result = a - b;       // Subtraction
            3'b010: result = a & b;       // Bitwise AND
            3'b011: result = a | b;       // Bitwise OR
            3'b100: result = a ^ b;       // Bitwise XOR
            3'b101: result = ~a;    // not
            3'b110: result = (a < b) ? 8'd1 : 8'd0; // Less Than
            3'b111: result = a << 1;      // Logical Shift Left
            default: result = a + b;
        endcase
    end

endmodule