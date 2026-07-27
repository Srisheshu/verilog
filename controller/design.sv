module controller ( 
    input clk, 
    input reset, 
    input en, 
    input [3:0] opcode, 
    output reg loadA, 
    output reg loadB, 
    output reg loadC, 
    output reg loadIR, 
    output reg loadPC, 
    output reg mode, 
    output reg we_DM, 
    output reg selA, 
    output reg selB
);

  always @(posedge clk or reset) begin
        if (reset) begin
            loadA  <= 0; loadB  <= 0; loadC  <= 0; 
            loadIR <= 0; loadPC <= 0; we_DM  <= 0;
            selA   <= 0; selB   <= 0; mode   <= 1'bz;
        end 
        else if (en) begin
          
            loadA  <= 0; loadB  <= 0; loadC  <= 0; 
            loadIR <= 0; loadPC <= 0; we_DM  <= 0;
            selA   <= 0; selB   <= 0; mode   <= 1'bz;
          
        case(opcode)
              
       4'b0000, 4'b0001, 4'b0010, 4'b0011: begin
                    mode  <= 1'b0;
                    we_DM <= 1'b1; 
                end

               
        4'b0100: loadA  <= 1'b1; 
         4'b0101: loadB  <= 1'b1; 
       4'b0110: loadC  <= 1'b1; 

               
          4'b0111: begin
            loadPC <= 1'b1; 
             selA   <= 1'b1; 
             selB   <= 1'b1;
                end

               
           4'b1000, 4'b1001, 4'b1010, 4'b1011, 
           4'b1100, 4'b1101, 4'b1110, 4'b1111: begin
              mode  <= 1'b1;
              we_DM <= 1'b1; 
                end

           default: begin
            loadIR <= 1'b1; 
                end
            endcase
        end
       else begin
        
          loadA  <= 0; loadB  <= 0; loadC  <= 0; 
          loadIR <= 0; loadPC <= 0; we_DM  <= 0;
           selA   <= 0; selB   <= 0;mode=1'bz;
        end
    end
endmodule