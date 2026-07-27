// Code your testbench here
// or browse Examples
module tb;

  reg clk_;
  reg reset_;
  reg x_;
  wire y_;

  seq_1011_moore DUT (
    .clk (clk_),
    .reset (reset_),
    .x (x_),
    .y (y_)
  );

 
  always #5 clk_ = ~clk_;

  integer i;

  initial begin
    clk_ = 0;
    reset_ = 1;
    x_  = 0;

  
  #12 reset_ = 0;

    for (i = 0; i < 30; i = i + 1) begin
      @(negedge clk_);
      x_ = $random % 2;  
    end

   #20 $finish;
  end

  initial begin
    $dumpfile("seq_1011_moore.vcd");
    $dumpvars(1, tb);
  end

endmodule
