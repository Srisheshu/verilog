module vending_machine (
    input clk,
    input reset,
    input coin5,
    input coin10,
    output reg candy
);

 
//   parameter S0     = 3'b000,  
//             S5     = 3'b001, 
//             S10    = 3'b010, 
//             S5C    = 3'b011, 
//             S15  = 3'b100; 
  
  typedef enum reg [2:0] {
    S0=3'b000,
    S5=3'b001,
    S10=3'b010,
    S15=3'b011,
    S20=3'b100
} fsm_state_t;


   fsm_state_t state, next_state;
  reg [5:0] timer;          
     

 
  always @(posedge clk or posedge reset) begin
    if (reset)
      state <= S0;
    else
      state <= next_state;
  end

 
  always @(posedge clk or posedge reset) begin
    if (reset)
      timer <= 0;
    else if (state == S20)
      timer <= timer + 1;
    else
      timer <= 0;
  end

 
  always @(*) begin
    
    
//     next_state=state;
    case (state)

      S0: begin
        if (coin5)      next_state = S5;
        else if (coin10) next_state = S10;
        else  next_state = S0;
      end

    
      S5: begin
        if (coin5)      next_state = S10;
        else if (coin10) begin
       
          next_state = S15;  
        end
        else  next_state = S5;
      end

 
      S10: begin
        if (coin5) begin
       
          next_state = S15;  
        end
        else if (coin10) begin
          next_state = S20;
        end
        else  next_state = S10;
      end

  
      S15: begin
       
//         if (credit_from_20)
//           next_state = S5C;  
//         else
          next_state = S0;
        
    end

 
      S20: begin
       
        if (timer == 6'd60) begin
        
          next_state = S0; 
        end
        else if (coin10)
          next_state = S15; 
         else if (coin5)
           next_state = S10;
        else  next_state = S20;
      end

      default: next_state = S0;

    endcase
  end
  
 
  assign candy=(state== S15 || ((state==S20)&& (timer==0)))?1:0;
  

endmodule
