module tb;

reg clk, reset, A, B;
  wire [3:0] OUT;
  wire [3:0] count_a;
wire [3:0] count_b;
wire [3:0] diff;

dut ab1 (
    .clk(clk),
    .reset(reset),
    .A(A),
    .B(B),
  .out(OUT),
  .count_a(count_a),
    .count_b(count_b),
    .diff(diff)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("ab_counter.vcd");
  $dumpvars(1, tb);

    clk = 0;
    reset = 1;
    A = 0;
    B = 0;

    #10 reset = 0;
    #25 A = 1;
    #5  A = 0;
    #65 B = 1;
    #5  B = 0;
     #25 A = 1;
    #5  A = 0;
   #65 B = 1;
    #5  B = 0;
  
    #20 $finish;
end

endmodule
