// `timescale 1s/1s

module tb;

  reg clk;
  reg reset;
  reg coin5;
  reg coin10;
  wire candy;

  vending_machine DUT (
    .clk(clk),
    .reset(reset),
    .coin5(coin5),
    .coin10(coin10),
    .candy(candy)
  );

 
  always #1 clk = ~clk;

  initial begin
    clk    = 0;
    reset  = 1;
    coin5  = 0;
    coin10 = 0;

    #1 reset = 0;

  
         
    @(negedge clk) coin5  = 1;
    @(negedge clk) coin5  = 0;

    @(negedge clk) coin5  = 1;
    @(negedge clk) coin5  = 0;

    
    @(negedge clk) coin10 = 1;
    @(negedge clk) coin10 = 0;

    repeat (25) @(negedge clk);
    
    @(negedge clk) coin10 = 1;
    @(negedge clk) coin10 = 0;

  
    repeat (31) @(negedge clk);

 
    @(negedge clk) coin10 = 1;
    @(negedge clk) coin10 = 0;
    
          
    @(negedge clk) coin5  = 1;
    @(negedge clk) coin5  = 0;
    
           
    @(negedge clk) coin5  = 1;
    @(negedge clk) coin5  = 0;

    #10 $finish;
  end

  initial begin
    $dumpfile("vending_machine.vcd");
    $dumpvars(1,tb);
    $dumpvars(1,DUT.state);
    $dumpvars(1,DUT.timer);
  end

endmodule
