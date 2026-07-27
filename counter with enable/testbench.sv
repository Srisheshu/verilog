// Code your testbench here
// or browse Examples
module tb_counter_en;

reg clk, reset, enable;
wire [3:0] q;

counter_en dut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .q(q)
);

always #5 clk = ~clk;   

initial begin
   
    $dumpfile("counter.vcd");   
  $dumpvars(1, tb_counter_en);

   
    clk = 0;
    reset = 1;
    enable = 0;

    #10 reset = 0;
    #10 enable = 1;
    #40 enable = 0;
    #10 reset = 1;
    #10 reset= 0;
    #20 enable = 1;

    #30 $finish;
end

endmodule
