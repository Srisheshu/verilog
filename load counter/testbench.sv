// Code your testbench here
// or browse Examples
module tb_step2_load_counter;

reg clk, reset, load;
reg [3:0] load_val;
wire [3:0] q;

step2_load_counter dut (.clk(clk),.reset(reset),.load(load),.load_val(load_val),.q(q));

always #5 clk = ~clk;

initial begin
    $dumpfile("step2_load.vcd");
  $dumpvars(1, tb_step2_load_counter);

    clk = 0;
    reset = 1;
    load = 0;
    load_val = 4'b0000;

    #10 reset = 0;

    #20 load_val = 4'b0101;  
    #10 load = 1;
    #20 load = 0;

    #120 $finish;
end

endmodule
