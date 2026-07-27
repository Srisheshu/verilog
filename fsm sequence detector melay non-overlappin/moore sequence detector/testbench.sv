// Code your testbench here
// or browse Examples
module tb;

  reg clk;
  reg reset;
  reg x;
  wire y;

  seq_1011_moore DUT (
    .clk(clk),
    .reset(reset),
    .x(x),
    .y(y)
  );

 
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    reset = 1;
    x = 0;

    #10 reset = 0;

    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 1;  // sequence detected 

    #10 x = 0;
    #10 x = 1;
    #10 x = 1;  // detected again

    #20 $finish;
  end

  initial begin
    $dumpfile("seq_1011_moore.vcd");
    $dumpvars(1, tb);
  end

endmodule
