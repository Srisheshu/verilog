// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps  

module tb;

   
    reg  [7:0] a, b;
    reg  [2:0] sel;
    wire [7:0] result;
    wire       zero;

   
    alu_8bit dut (
      .a(a), 
        .b(b),
        .sel(sel),
        .result(result),
        .zero(zero)
    );

    initial begin
      
        $monitor("%0t\t %d \t %d \t %b \t %d \t\t %b", $time, a, b, sel, result, zero);

       
//         a = 8'd2; b = 8'd3; sel = 3'b000;
//         #10; 
      
//          a = 8'b0000_1010; b = 8'b0000_1100; sel = 3'b100;
//         #10;

        
//         a = 8'd5; b = 8'd5; sel = 3'b001;
//         #10;

      
      a = 4'b1010; b = 4'b0011;

    sel = 3'b000; #10; 
    sel = 3'b001; #10; 
    sel = 3'b010; #10; 
    sel = 3'b011; #10; 
    sel = 3'b100; #10; 
    sel = 3'b101; #10; 
    sel = 3'b110; #10; 
    sel = 3'b111; #10; 
       
        #10;

        $finish; 
    end
  
   
  initial
    begin
      $dumpfile("alu_8bit.vcd");
      $dumpvars(1,tb);       
    end

endmodule