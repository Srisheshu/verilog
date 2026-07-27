// Code your design here
module seq_1011_moore (
    input clk,
    input reset,
    input x,
    output reg y
);

  reg [3:0] state, next_state;

  
  parameter IDEAL =4'b0000,
            S0 = 4'b0001,
            S1 = 4'b0010,
            S2 = 4'b0011,
            S3 = 4'b0100,
            S4 = 4'b0101,
            S5 = 4'b0110,
            S6 = 4'b0111,
            S7 = 4'b1000,
            S8 = 4'b1001;
 

  
  always @(posedge clk or reset) begin
    if (reset)
      state <= IDEAL;
    else
      state <= next_state;
  end

 
  always @(*) begin
    case (state)
      IDEAL: begin
        if (x) next_state = S1;
        else   next_state = S0;
      end
      
      S0: begin
        if (x) next_state = S2;
        else   next_state = S0;
      end
      
      S1: begin
        if (x) next_state = S3;
        else   next_state = S0;
      end

      S2: begin
        if (x) next_state = S3;
        else   next_state = S4;
      end

      S3: begin
        if (x) next_state = S5;
        else   next_state = S0;
      end

      S4: begin
        if (x) next_state = S6; 
        else   next_state = S0;
      end
      
      S5: begin
        if (x) next_state = S7; 
        else   next_state = S0;
      end
      
      S6: begin
        if (x) next_state = S3; 
        else   next_state = S4;
      end
      
      S7: begin
        if (x) next_state = S7;
        else   next_state = S0;
      end

      default: next_state = IDEAL;
    endcase
  end

  
  always @(*) begin
    if (state == S6 || state == S7)
      y = 1;
    else
      y = 0;
  end

endmodule
