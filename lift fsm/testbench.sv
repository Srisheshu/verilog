// Code your testbench here
// or browse Examples
module tb;

reg clk, reset;
reg [1:0] req_floor;
wire [1:0] current_floor;

lift_fsm dut (
    .clk(clk),
    .reset(reset),
    .req_floor(req_floor),
    .current_floor(current_floor)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("lift_fsm.vcd");
  $dumpvars(1, tb);

    clk = 0;
    reset = 1;
    req_floor = 2'b00; 
    #10;

    reset = 0;

    
    req_floor = 2'b01;
    #30;

    req_floor = 2'b00;
    #30;

    req_floor = 2'b11;
    #30;

    req_floor = 2'b00;
    #30;
   
    $finish;
end

endmodule
