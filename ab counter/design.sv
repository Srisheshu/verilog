module en_counter (
    input clk,
    input reset,
    input enable,
  output reg  [3:0] q
);

always @(posedge clk) begin
    if (reset)
        q <= 4'b0000;
    else if (enable)
        q <= q + 1'b1;
    else
        q <= q;  
end

endmodule

module dut (
    input  clk,
    input  reset,
    input  A,
    input  B,
    output reg [3:0] out,       
    output reg [3:0] count_a,   
    output reg [3:0] count_b,   
    output reg [3:0] diff       
);

reg en;

always @(posedge clk) begin
    if (reset)
        en <= 1'b0;
  else if (A)
        en <= 1'b1;
    else if (B)
        en <= 1'b0;
end

en_counter u1 (
    .clk(clk),
    .reset(reset),
    .enable(en),
    .q(out)
);

always @(posedge clk) begin
    if (reset) begin
        count_a <= 4'b0000;
        count_b <= 4'b0000;
        diff    <= 4'b0000;
    end
    else begin
        if (A)
            count_a <= out;        

        if (B) begin
            count_b <= out;        
            diff    <= out - count_a;
        end
    end
end

endmodule
