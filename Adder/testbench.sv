`timescale 1ns/1ps

module tb;

  reg  [2:0] x;
  wire [1:0] y;

  ones_counter_3bit dut (
    .x(x),
    .y(y)
  );

  initial begin
    $display(" x    y (count of 1s)");
    $display("---------------------------");

    x = 3'b000; #10;
    $display(" %b %b", x, y);

    x = 3'b001; #10;
    $display(" %b %b",  x, y);

    x = 3'b010; #10;
    $display(" %b %b", x, y);

    x = 3'b011; #10;
    $display(" %b %b",  x, y);

    x = 3'b100; #10;
    $display(" %b %b",  x, y);

    x = 3'b101; #10;
    $display(" %b %b",  x, y);

    x = 3'b110; #10;
    $display(" %b %b",  x, y);

    x = 3'b111; #10;
    $display(" %b %b", x, y);

    $finish;
  end
  
  initial begin
    
    $dumpfile("ones_counter_3bit");
    $dumpvars(1,tb);
    
  end

endmodule
