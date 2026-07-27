// Code your design here
module dff(
input d,
input clk,
  input wire reset,
  output reg q
);
  always @(posedge clk or posedge reset)
   begin
     if (reset==1)
       q<=1'b0;
     else q<=d;
   end
endmodule


module freq_divider (
    input  wire clk_100mhz,   
    input  wire reset,
    output wire q0,          
    output wire q1            
);
  wire d0, d1;

    assign d0 = ~q0;
    assign d1 = ~q1;

    dff dff0 (
        .d     (d0),
        .clk   (clk_100mhz),
      .reset(reset),
        .q     (q0)
    );

    dff dff1 (
      .d     (d1),
        .clk   (q0),
        .reset(reset),
      .q     (q1)
    );

endmodule



