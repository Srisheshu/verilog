// Code your design here
module multiplication (
    input  [3:0] multiplicand,
    input  [3:0] multiplier,
    output reg [7:0] product
);

integer i;

always @(*) begin
    product = 8'b00000000;  
    
    for (i = 0; i < 4; i = i + 1) begin
        if (multiplier[i] == 1'b1)
            product = product + (multiplicand << i);
    end
end

endmodule