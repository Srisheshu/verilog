module tb;

reg clk, reset;
reg NScar, EWcar;
wire NSlite, EWlite;


traffic_controller dut (
  .clk(clk),
    .reset(reset),
    .NScar(NScar),
    .EWcar(EWcar),
    .NSlite(NSlite),
    .EWlite(EWlite)
   
);

always #5 clk = ~clk;

initial begin
   
  $monitor("T=%0t NS=%b EW=%b  NScar=%b EWcar=%b",
              $time,  NSlite, EWlite, NScar, EWcar);

 clk = 0;
 reset = 1;
NScar = 0;
EWcar = 0;

 #10 reset = 0;

#70  EWcar = 1;  
#240 EWcar = 0;

 #90  NScar = 1;
 #200 NScar = 0;
  
  #60  EWcar = 1;
  #10  NScar = 1;

 #700 $finish;
end
  initial begin
   $dumpfile("traffic.vcd");
    $dumpvars(1, dut);
  end


endmodule
