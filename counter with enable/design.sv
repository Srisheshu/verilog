// Code your design here
module counter_en (
    input  clk,
    input  reset,
    input  enable,
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


module srlatch (
  input s,
  input r,
  output reg q
 // output reg qbar
);

  always @ (s or r) begin 
    if (s == 1'b1 && r == 1'b0) q= 1'b1;
    else if (s == 1'b0 && r == 1'b1)  q= 1'b0;
    else if (s == 1'b0 && r == 1'b0) q= q;
 else q= 1'b0;
  end

endmodule


module mnlatch (
  input c,
  input m,
  input n,
  output q
);

  wire s,r; 
  
  assign s= c & m & n;
  assign r= c & (~m) & (~n);

  srlatch s1 (.s(s),.r(r),.q(q));

endmodule

module ab_counter (
  input clk,
  input a,
  input b,
  output out
);

wire clk,reset,enable;
  
  assign clk=clk;
  assign a=reset;
  assign 