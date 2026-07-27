// Code your design here
module step2_load_counter (
    input clk,
    input reset,
    input load,
    input [3:0] load_val,
    output reg [3:0] q
);

always @(posedge clk) begin
    if (reset)
        q <= 4'b0000;
    else if (load)
        q <= load_val;       
    else
        q <= q + 1'b1;    
end

endmodule
