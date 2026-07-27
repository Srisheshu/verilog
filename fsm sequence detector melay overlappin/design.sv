// Code your design here
module seq_1011_detector (
    input clk,
    input reset,
    input x,
    output reg y
);

  reg [1:0] current_state, next_state;

  
  parameter S0 = 2'b00,
            S1 = 2'b01,
            S2 = 2'b10,
            S3 = 2'b11;

  
  always @(posedge clk or posedge reset) begin
    if (reset)
      current_state <= S0;
    else
      current_state <= next_state;
  end

 
  always @(*) begin
    y = 0;
    case (current_state)
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
        if (x) begin
          next_state = S1; // overlap
          y = 1;           // 1011 detected
        end else
          next_state = S2;
      end

      default: next_state = S0;
    endcase
  end

endmodule
