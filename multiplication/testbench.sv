// Code your testbench here
// or browse Examples
module tb;

reg  [3:0] multiplicand;
reg  [3:0] multiplier;
wire [7:0] product;

multiplication dut (
    .multiplicand(multiplicand),
    .multiplier(multiplier),
    .product(product)
);

initial begin
    multiplicand = 4'b1010; 
    multiplier   = 4'b0110; 
    #10;
    $display("Product = %b", product); 
end

  initial
    begin
      $dumpfile("multiplication.vcd");
      $dumpvars(1,tb);       
    end
  
endmodule