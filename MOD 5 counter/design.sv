// Code your design here
module counter(q,clk,reset);
  input clk,reset;
  output reg [2:0]q;
  
  always @(posedge clk )
    begin
      if (reset)
        q<=4'b000;
      else if (q==4'b100)
        q<=4'b0000;
      else 
        q<=q+1;
    end 
endmodule