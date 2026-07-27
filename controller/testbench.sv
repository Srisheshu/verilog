

module tb_controller();

    reg [3:0] opcode;
    reg en;
    reg clk; 
    reg reset;

    wire loadA, loadB, loadC, loadIR, loadPC, mode, we_DM, selA, selB;

    
    controller c1 (
        .opcode(opcode), 
        .en(en), 
        .clk(clk),
      .reset(reset),
        .loadA(loadA), 
        .loadB(loadB), 
        .loadC(loadC), 
        .loadIR(loadIR), 
        .loadPC(loadPC), 
        .mode(mode), 
        .we_DM(we_DM), 
        .selA(selA), 
        .selB(selB)
    );

   
   always #5 clk = ~clk;
    initial begin
        clk=0;
        reset=1;
        en = 0;
        opcode = 4'b0000;
        reset=0;
        #10;
        en = 1;

        opcode = 4'b0000; #10;
      
        opcode = 4'b0001; #10;
      
        opcode = 4'b0010; #10;
      
        opcode = 4'b0011; #10;

        opcode = 4'b0100; #10;
      
         opcode = 4'b0101; #10;
      
         opcode = 4'b0110; #10;
      
        
        opcode = 4'b0111; #10;
      

        opcode = 4'b1000; #10;
        
         opcode = 4'b1001; #10;
      
         opcode = 4'b1010; #10;
      
        opcode = 4'b1011; #10;
      
        opcode = 4'b1100; #10;
      
        opcode = 4'b1101; #10;
      
        opcode = 4'b1110; #10;
      
        opcode = 4'b1111; #10;
      
        opcode = 4'b0101; #10;
      
        opcode = 4'b0100; #10;
       
        en = 0; opcode = 4'b0000; #10;
       
        #20;
        $finish;
    end
  
  initial begin
   
    $dumpfile("countroller.vcd");   
    $dumpvars(1, c1.loadA, c1.loadB, c1.loadC, c1.loadPC, c1.mode, c1.loadIR, c1.we_DM, c1.selA, c1.selB);
  end
      
endmodule