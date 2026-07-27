module traffic_controller (
  input  clk,
   input  reset,
  input  NScar,
  input  EWcar,
   output reg NSlite,
   output reg EWlite
 
);

reg state,next_state;        
reg [4:0] count;  
  wire s_change;


always @(posedge clk or posedge reset) begin
    if (reset)
        count <= 5'd0;
    else if (count == 5'd29)
        count <= 5'd0;
    else
        count <= count + 1'b1;
end



always @(posedge clk or posedge reset) begin
    if (reset)
        state <= 1'b0; 
  else if(s_change==1) 
       state<=next_state;
    
end

always @(*) begin
    case (state)
        1'b0: begin 
          if (EWcar)
                next_state = 1'b1;
           else
               next_state = 1'b0;
        end

        1'b1: begin 
          if (!NScar)
                next_state = 1'b1;
            else
                next_state = 1'b0;
        end
    endcase
end


  
always @(*) begin
    if (state == 1'b0) begin
        NSlite = 1'b1;
        EWlite = 1'b0;
    end
    else begin
        NSlite = 1'b0;
        EWlite = 1'b1;
    end
end

  assign  s_change=(count==29)?1:0;
 

endmodule
