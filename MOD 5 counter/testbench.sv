// Code your testbench here
// or browse Examples
module tb;
  reg clk,reset;
  wire [2:0]a;
  
  counter COUNTER1(.q(a),.clk(clk),.reset(reset));
  
  initial begin
    
    $dumpfile("tff_wave.vcd");   
    $dumpvars(1, tb); 
    clk=0;
    reset=1;
    #20 reset =0;
   
    #300 $finish;
  end
    always #5 clk=~clk;
  
endmodule