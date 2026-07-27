// Code your design here
module lift_fsm (
    input clk,
    input reset,
    input [1:0] req_floor,  
    output reg [1:0] current_floor
);

always @(posedge clk or posedge reset) begin
    if (reset)
        current_floor <= 2'b00; 
    else begin
        if (req_floor > current_floor)
            current_floor <= current_floor + 1'b1; 
        else if (req_floor < current_floor)
            current_floor <= current_floor - 1'b1;
        else
            current_floor <= current_floor;
    end
end

endmodule
