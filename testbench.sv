// Code your testbench here
// or browse Examples

`timescale 1ns/1ns

module tb;

    reg clk100 = 0;
    reg reset = 0;
    wire clk50,clk25;

    freq_divider dut (
      .clk_100mhz(clk100),
        .reset(reset),
      .q0(clk50),
      .q1(clk25)
    );
  
  


    always #5 clk100 = ~clk100; 

  initial begin
    
    #1 reset=1;
      #20 reset = 0;
    
       
        #500;
   
        $finish;
    end
  initial begin
     $dumpfile("freq_divider.vcd");
//     $dumpvars(1, dut.dff1);
//     $dumpvars(1, dut.dff0);
    $dumpvars(1, tb);
    
  end

endmodule
