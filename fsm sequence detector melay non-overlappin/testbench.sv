// Code your testbench here
// or browse Examples
module tb;

  reg clk;
  reg reset;
  reg x;
  wire y;

  seq_1011_detector DUT (
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
    #10 x = 1;  // first detection

    #10 x = 0;
    #10 x = 1;
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 1;// second detection

    #20 $finish;
  end

  initial begin
    $dumpfile("seq_1011.vcd");
    $dumpvars(1, tb);
  end

endmodule
