// Code your testbench here
// or browse Examples
module tb;
  reg clk,reset;
  wire [3:0]a;
  
  counter COUNTER1(.q(a),.clk(clk),.clear(reset));
  //counter COUNTER2(.q(b),.clk(clk),.clear(reset));
  
  initial begin
    
    $dumpfile("tff_wave.vcd");  
    $dumpvars(1, tb); 
    clk=0;
   #10 reset=1;
    #20 reset =0;
    #250 reset=1;
    #300 $finish;
  end
    always #5 clk=~clk;
  
endmodule