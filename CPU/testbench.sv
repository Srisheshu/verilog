// `timescale 1ns / 1ps
// module cpu_top (
//     input clk,
//     input reset,
//     input en,
//     input [15:0] code_in, 
//     input we_IM,          
//     output [11:0] pc_val  
// );

    
//     wire [11:0] execution_addr;     
//     wire [11:0] curr_addr;           
//     wire [15:0] instr_data;       
//     wire [3:0]  wire_opcode;        
//     wire [11:0] wire_immediate;   
    
 
//     wire loadA, loadB, loadC, loadIR, loadPC, mode, we_DM, sel1, sel2;


//     program_counter pc_unit (
//         .clk(clk),
//         .reset(reset),
//         .load_pc(loadPC),
//         .inc_pc(!loadPC && en),     
//         .input_addr(wire_immediate),
//         .pc_out(execution_addr)
//     );

//     mux mux1 (
//         .pc_address(execution_addr),
//         .immediate_addr(wire_immediate),
//         .sel1(sel1),
//         .curr_addr(curr_addr)
//     );

   
//     instruction_memory imem (
//         .clk(clk),
//         .we(we_IM),
//         .code_in(code_in),
//         .addr(curr_addr),            
//         .q(instr_data)
//     );

   
//     instruction_register ir_unit (
//         .clk(clk),
//         .reset(reset),
//         .load_ir(loadIR),
//         .inst_in(instr_data),
//         .opcode(wire_opcode),
//         .address(wire_immediate)
//     );

   
//     controller ctrl_unit (
//         .clk(clk),
//         .reset(reset),
//         .en(en),
//         .opcode(wire_opcode),
//         .loadA(loadA),
//         .loadB(loadB),
//         .loadC(loadC),
//         .loadIR(loadIR),
//         .loadPC(loadPC),
//         .mode(mode),    
//         .we_DM(we_DM),
//         .selA(sel1),   
//         .selB(sel2)
//     );

//     assign pc_val = execution_addr;

// endmodule

// module tb_program_counter;

//     reg clk;
//     reg reset;
//     reg load_pc;
//     reg inc_pc;
//   reg [11:0] input_addr;

   
//   wire [11:0] pc_out;


//     program_counter uut (
//         .clk(clk), 
//         .reset(reset), 
//         .load_pc(load_pc), 
//         .inc_pc(inc_pc), 
//       .input_addr(input_addr), 
//         .pc_out(pc_out)
//     );

   
//     always #5 clk = ~clk;

//     initial begin
        
//         clk = 0;
//         reset = 1;      
//         load_pc = 0;
//         inc_pc = 0;
//         input_addr = 16'h0000;

       
//         #20;
//         reset = 0;
        
      
//         #10 inc_pc = 1;  
//         #10;             
//         #10;            
//         inc_pc = 0;   
        
//         #10;
//         input_addr = 12'hABC;
//         load_pc = 1;    
//         #10;
//         load_pc = 0;
        
      
//         #10 inc_pc = 1;  
//         #10 inc_pc = 0;

      
//         #10 reset = 1;  
//         #10 reset = 0;

//         #20 $finish;
//     end
    
//     initial begin
//       $dumpfile("program_counter.vcd");
//       $dumpvars(1,tb_program_counter);
//     end

// endmodule

// module tb_mux;

//   reg [11:0] pc_address;
//   reg [11:0] immediate_addr;
//     reg sel1;

//     wire [15:0] curr_addr;

//     mux uut (
//         .pc_address(pc_address), 
//         .immediate_addr(immediate_addr), 
//         .sel1(sel1), 
//         .curr_addr(curr_addr)
//     );

//     initial begin
//         pc_address = 12'hAAA;
//         immediate_addr = 12'hBBB;
//         sel1 = 0;

        
//         #10 sel1 = 0; 
        
       
//         #10 sel1 = 1; 
        
        
//         #10 immediate_addr = 16'hCCCC; 
        
//         #10 $finish;
//     end
  
//    initial begin
//      $dumpfile("mux.vcd");
//      $dumpvars(1,tb_mux);
//     end

// endmodule

// module instruction_memory_tb;
//   reg [15:0] code_in;
//   reg [11:0] addr; 
//   reg we; 
//   reg clk;
//   wire [15:0] q;
 
  
//   instruction_memory im1(
//     .code_in(code_in),
//     .addr(addr),
//     .we(we),
//     .clk(clk),
//     .q(q)
//   );
  
//       always #5 clk = ~clk;
  
//      initial begin
//        $readmemh("instr_mem.hex", im1.ram);
//        #1000$finish;
//   end
  
//   initial
//     begin
//       clk=0;
//       code_in = 16'h01AB;
//       addr = 12'h000;
//       we = 1'b1;
//       #15;
           
// 	  code_in = 16'h02;
//       addr = 12'h161;     
//       #10;
      
//       code_in = 16'h03;
//       addr = 12'h162;     
//       #10;
//       code_in = 16'hFFFF;
//       addr = 12'hfff;     
//       #10;
      
//       addr = 12'h000;
//       we = 1'b0;
//       #10;
      
//       addr = 12'h000;
//       we = 1'b0;
//       #10;
      
      
//       addr = 12'h161;
//       #10;
      
//       addr = 12'h162;
//       #10;
      
//       code_in = 16'h04;
//       addr = 12'h166;
//       we = 1'b1;
//       #10;
      
//       addr = 12'h166;
//       we = 1'b0;
//       #10;
      
//       addr = 12'd3;
//       #10;
//       $finish;
//     end
  
//    wire [15:0] check_ram_555; 
//   assign check_ram_555 = im1.ram[2];
  
  
//   initial begin
//     for (int i = 0; i < 4096; i++) begin
//       im1.ram[i] = $urandom();  
//     end
    
//     $display("RAM[0] %h", im1.ram[0]);
//     $display("RAM[1] %h", im1.ram[1]);
    
//     clk=0;
//         addr = 12'h100;
//        we = 1'b0;
//        #10;
    
//     code_in = 16'hFFFF;
//       addr = 12'h000;  
//     we=1;
//       #10;
    
      
//       addr = 12'h000;
//       we = 1'b0;
//       #10;
      
      
//        addr = 12'h161;
//        #10;
    
//      addr = 12'hfff;
//        #10;
//      code_in = 16'hFFFF;
//       addr = 12'h000;  
//     we=1;
    
//     #10
//     addr = 12'h000;  
//     we=1'b0;
    
    
//     #100$finish;
    
//   end
  
//   initial
//     begin
//       $dumpfile("instruction_memory.vcd");
//       $dumpvars(1, instruction_memory_tb.q);  
//     end
  
// endmodule


// module tb_instruction_register;

//     reg clk;
//     reg reset;
//     reg load_ir;
//     reg [15:0] inst_in;

//     wire [3:0] opcode;
//   wire [11:0] address;

//     instruction_register uut (
//         .clk(clk), .reset(reset), .load_ir(load_ir), 
//       .inst_in(inst_in), .opcode(opcode), .address(address)
//     );

//     always #5 clk = ~clk;

//     initial begin
//         clk = 0; reset = 1; load_ir = 0; inst_in = 16'h0000;
//         #15 reset = 0;

//         #10 inst_in = 16'hEABC; 
//             load_ir = 1;      
//         #10 load_ir = 0;      
        
//         #10 inst_in = 16'hF123; 
      
//          #10 inst_in = 16'hAACC; 
//             load_ir = 1;      
//         #10 load_ir = 0; 
      
//         #10 inst_in = 16'hA123; 
      
//          #10 load_ir = 1;      
//         #10 load_ir = 0;
      
//         #10 inst_in = 16'hB555;
      
        
//         #20 $finish;
//     end
  
//   initial
//     begin
//       $dumpfile("instruction_memory.vcd");
//       $dumpvars(1,tb_instruction_register );       
//     end
    
// endmodule

// module tb_controller();

//     reg [3:0] opcode;
//     reg en;
//     reg clk; 
//     reg reset;

//     wire loadA, loadB, loadC, loadIR, loadPC, mode, we_DM, selA, selB;

    
//     controller c1 (
//         .opcode(opcode), 
//         .en(en), 
//         .clk(clk),
//       .reset(reset),
//         .loadA(loadA), 
//         .loadB(loadB), 
//         .loadC(loadC), 
//         .loadIR(loadIR), 
//         .loadPC(loadPC), 
//         .mode(mode), 
//         .we_DM(we_DM), 
//         .selA(selA), 
//         .selB(selB)
//     );

   
//    always #5 clk = ~clk;
//     initial begin
//         clk=0;
//         reset=1;
//         en = 0;
//         opcode = 4'b0000;
//         reset=0;
//         #10;
//         en = 1;

//         opcode = 4'b0000; 
      
//         #10;opcode = 4'b0001; 
      
//         #10;opcode = 4'b0010; 
      
//         #10;opcode = 4'b0011; 

//         #10;opcode = 4'b0100; 
      
//          #10;opcode = 4'b0101; 
      
//          #10;opcode = 4'b0110; 
      
        
//         #10;opcode = 4'b0111; #10;
      

//         opcode = 4'b1000; #10;
        
//          opcode = 4'b1001; #10;
      
//          opcode = 4'b1010; #10;
      
//         opcode = 4'b1011; #10;
      
//         opcode = 4'b1100; #10;
      
//         opcode = 4'b1101; #10;
      
//         opcode = 4'b1110; #10;
      
//         opcode = 4'b1111; #10;
      
//         opcode = 4'b0101; #10;
      
//         opcode = 4'b0100; #10;
       
//         en = 0; opcode = 4'b0000; #10;
       
//         #20;
//         $finish;
//     end
  
//   initial begin
   
//     $dumpfile("countroller.vcd");   
//     $dumpvars(1, c1.loadA, c1.loadB, c1.loadC, c1.loadPC, c1.mode, c1.loadIR, c1.we_DM, c1.selA, c1.selB);
//   end
      
// endmodule



// module tb();
   
//     reg clk;
//     reg reset;
//     reg en;
//     reg [15:0] code_in;
//     reg we_IM;
    
  
//     wire [11:0] pc_val;

   
//     cpu_top uut (
//         .clk(clk),
//         .reset(reset),
//         .en(en),
//         .code_in(code_in),
//         .we_IM(we_IM),
//         .pc_val(pc_val)
//     );

//    initial begin
        
//         uut.imem.ram[0] = 16'h4000; 
//         uut.imem.ram[1] = 16'h5000; 
//         uut.imem.ram[2] = 16'h7123; 
//     end

   
//     always #5 clk = ~clk;
  
  

//     initial begin
       
//         clk = 0;
//         reset = 1;
//         en = 0;
//         we_IM = 0;
//         code_in = 0;

       
//         #20 reset = 0;
//       #10 en = 1;
      
      
//         #200;

       
//      $finish;
//     end
//     initial begin
//         $dumpfile("dump.vcd");
//       $dumpvars(1, uut.imem.ram[0]);
//     end 

// endmodule



// module alu_tb();

 
//     reg [15:0] A;
//     reg [15:0] B;
//     reg [3:0]  opcode;
//     reg mode;

   
//     wire [15:0] ALU_out;

  
//     alu alu1 (
//         .A(A), 
//         .B(B), 
//         .opcode(opcode), 
//       .mode(mode),
//         .ALU_out(ALU_out)
//     );

//     initial begin
        
//         A = 16'd10;
//        #10 B = 16'd5;
//        #10 opcode = 4'b0000;
//        #10 mode=1;

       
//         #100;
        
       
//         $display("Testing Mode 0 (Arithmetic)");
//         opcode = 4'b0000; #10; $display("ADD: %d + %d = %d", A, B, ALU_out);
//         opcode = 4'b0001; #10; $display("MUL: %d * %d = %d", A, B, ALU_out);
//         opcode = 4'b0010; #10; $display("SUB: %d - %d = %d", A, B, ALU_out);
//         opcode = 4'b0011; #10; $display("DIV: %d / %d = %d", A, B, ALU_out);

       
//         A = 16'hAAAA; 
//         B = 16'h5555; 
//         #10;

       
//         $display("Testing Mode 1 (Logical)");
//         opcode = 4'b1000; #10; $display("AND:  %h & %h = %h", A, B, ALU_out);
//         opcode = 4'b1001; #10; $display("OR:   %h | %h = %h", A, B, ALU_out);
//         opcode = 4'b1010; #10; $display("NAND: ~(%h & %h) = %h", A, B, ALU_out);
//         opcode = 4'b1110; #10; $display("XOR:  %h ^ %h = %h", A, B, ALU_out);
//         opcode = 4'b1100; #10; $display("NOT A: ~%h = %h", A, ALU_out);

       
//         opcode = 4'b0100; #10; 

//         #50;
//         $finish;
//     end
      
//   initial begin
//          $dumpfile("dump.vcd");
//        $dumpvars(1,alu_tb );
//      end
  
// endmodule



// module data_memory_tb();

  
//     reg [11:0] addr;
//     reg [15:0] data_in;
//     reg        write_en;
//     reg        clk;

  
//     wire [15:0] data_out;

   
//     data_memory dm5 (
//         .addr(addr), 
//         .data_in(data_in), 
//         .write_en(write_en), 
//         .clk(clk), 
//         .data_out(data_out)
//     );

  
//     always #5 clk = ~clk;
      
//   initial begin
//     for (int i = 0; i < 4096; i++) begin
//       dm5.ram[i] = $urandom();  
//     end
    
//     $display("RAM[0] %h", dm5.ram[0]);
//     $display("RAM[4095] %h", dm5.ram[4095]);
//     #10$finish;
    
//   end
  
//   wire [15:0] check_ram_666; 
//   assign check_ram_666 = dm5.ram[4095];
  
// //   initial begin
// //          $dumpfile("data_memory_tb.vcd");
// //     $dumpvars(1,check_ram_666 );
// //      end
  
// endmodule


`timescale 1ns / 1ps
module cpu_tb();
    reg clk;
    reg reset;
    reg enable;
    reg [15:0] ext_code_in;
    reg ext_we_IM;

    cpu_top uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .ext_code_in(ext_code_in),
        .ext_we_IM(ext_we_IM)
    );

    
    always #5 clk = ~clk;

    initial begin
        
        clk = 0;
        reset = 1;
        enable = 0;
        ext_we_IM = 0;
        ext_code_in = 0;
      
        #20 reset = 0;
      
//       ext_we_IM = 1;
//     ext_code_in = 16'h4000; 
//       ext_we_IM = 0; enable = 1;
//       #10 enable = 0;
      enable = 1;
       //#20 enable = 0;
    
     
    end
  wire [15:0] check_ram_333; 
  assign check_ram_333 = uut.IM.ram[0];
  
  
  //instruction memory
  initial begin
    $readmemh("instr_mem.hex", uut.IM.ram);
       #1000$finish;
  end
  
  
  //data memory
    initial begin
    for (int i = 0; i < 4096; i++) begin
      uut.DM.ram[i] = $urandom() & 16'h7FFF;
    end
    
      $display("RAM[0] %h", uut.DM.ram[5]);
      $display("RAM[4095] %h", uut.DM.ram[4095]);
   
    
  end
  
  wire [15:0] check_ram_666; 
  assign check_ram_666 = uut.DM.ram[5];
  
  initial begin
    $dumpfile("cpu_tb.vcd");
    $dumpvars(1,uut.opcode_w);
     $dumpvars(1,uut.regA_out);
    $dumpvars(1,uut.regB_out);
    $dumpvars(1,uut.regC_out);
    $dumpvars(1,cpu_tb.check_ram_666);
 //   $dumpvars(1,uut.loadA); 
  //  $dumpvars(1,uut.loadB);
    $dumpvars(1,uut.alu_out);
 //   $dumpvars(1,uut.n_flag);
    $dumpvars(1,uut.loadC);
 //   $dumpvars(1,uut.loadPC);
    $dumpvars(1,uut.caddr_w);
    $dumpvars(1,uut.clk);
      $dumpvars(1,uut.ir_address);
  end
    
    
  
endmodule


// uut.CPU_Controller.loadPC,uut.CPU_Controller.mode,uut.CPU_Controller.we_DM,uut.CPU_Controller.selA,uut.CPU_Controller.selB,uut.CPU_Controller.reset,uut.CPU_Controller.en,uut.CPU_Controller.clk,

//uut.CPU_Controller.loadC,uut.CPU_Controller.loadIR,uut.CPU_Controller.opcode 

// uut.CPU_Controller.loadB,uut.CPU_Controller.loadA,uut.CPU_Controller.loadC

//uut.CPU_Controller.loadC,uut.CPU_Controller.loadB,uut.RegisterC