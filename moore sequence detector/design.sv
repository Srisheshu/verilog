// Code your design here
module seq_1011_moore (
    input clk,
    input reset,
    input x,
    output reg y
);

  reg [2:0] state, next_state;

  
  parameter S0 = 3'b000,
            S1 = 3'b001,
            S2 = 3'b010,
            S3 = 3'b011,
            S4 = 3'b100;

  
  always @(posedge clk or reset) begin
    if (reset)
      state <= S0;
    else
      state <= next_state;
  end

 
  always @(*) begin
    case (state)
      S0: begin
        if (x) next_state = S1;
        else   next_state = S0;
      end

      S1: begin
        if (x) next_state = S1;
        else   next_state = S2;
      end

      S2: begin
        if (x) next_state = S3;
        else   next_state = S0;
      end

      S3: begin
        if (x) next_state = S4;
        else   next_state = S2;
      end

      S4: begin
        if (x) next_state = S1; // overlap
        else   next_state = S2;
      end

      default: next_state = S0;
    endcase
  end

  
  always @(*) begin
    if (state == S4)
      y = 1;
    else
      y = 0;
  end

endmodule
