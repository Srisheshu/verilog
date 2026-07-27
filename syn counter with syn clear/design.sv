// Code your design here
module counter(q,clk,clear);
  input clk,clear;
  output reg [3:0]q;
  
  always @(posedge clk )
    begin
      if (clear)
        q<=4'b0000;
      else 
        q<=q+1;
    end 
endmodule