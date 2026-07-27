// Code your testbench here
// or browse Examples
module tb_up_down_counter;

reg clk;
reg reset;
reg up_down;
wire [3:0] count;

up_down_counter dut (
    .clk(clk),
    .reset(reset),
    .up_down(up_down),
    .count(count)
);


always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    up_down = 1;

  #10 reset = 0;    
  #50 up_down = 1;  // count up
   #50 up_down = 0;  // count down
   #50 $finish;
end
  initial begin
    $dumpfile("up_down_counter.vcd");
    $dumpvars(1, tb_up_down_counter);
  end

endmodule
