// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

`include "instruction_memory"
`include "program_counter"
`include "mux"
`include "instruction_register"
`include "controller"
`include "alu"
`include "reg_16bit"
`include "data_memory"
`include "controller_combo"



  module cpu_top (
    input clk,
    input reset,
    input enable,
    input [15:0] ext_code_in,
    input ext_we_IM
);

   
    wire [11:0] pc_out, ir_address,caddr_w;
    wire [15:0] instr_data, dm_out, alu_out, regA_out, regB_out, regC_out;
    wire [3:0] opcode_w;
    wire n_flag;
   
    
   
    wire loadA, loadB, loadC, loadIR, loadPC, we_DM, mode_w, sel1, sel2;
    wire [3:0] alu_opcode; 

    
    program_counter PC (
        .clk(clk),
        .reset(reset),
        .load_pc(loadPC),
        .inc_pc(enable && !loadPC), 
        .input_addr(ir_address),
        .pc_out(pc_out)
    );

    
    
    mux m1 (
        
        .pc_address(pc_out),
        .immediate_addr(ir_address),
        .loadpc(loadPC), 
      .curr_addr(caddr_w)
        
    );

    
    
  
    instruction_memory IM (
        .clk(clk),
        .we(ext_we_IM),
        .addr(caddr_w),
        .code_in(ext_code_in),
        .q(instr_data)
    );

    
    instruction_register IR (
        .clk(clk),
        .reset(reset),
//         .load_ir(loadIR),
        .inst_in(instr_data),
      .opcode(opcode_w),
        .address(ir_address)
    );

    
    controller_combo CPU_Controller (
        .clk(clk),
        .reset(reset),
        .en(enable),
      .opcode(opcode_w),
      .neg_flag(n_flag),
        .loadA(loadA),
        .loadB(loadB),
        .loadC(loadC),
        .loadIR(loadIR),
        .loadPC(loadPC),
      .mode(mode_w),
        .we_DM(we_DM),
        .selA(sel1), 
        .selB(sel2)  
    );

  
    reg_16bit RegisterA (
        .clk(clk),
        .rst(reset),
        .ld(loadA),
        .data_in(dm_out),
        .q(regA_out)
    );

    
    reg_16bit RegisterB (
        .clk(clk),
        .rst(reset),
        .ld(loadB),
        .data_in(dm_out),
        .q(regB_out)
    );

    
    alu CPU_ALU (
        .A(regA_out),
        .B(regB_out),
      .mode(mode_w),
      .opcode(opcode_w),
      .neg_flag(n_flag),
        .ALU_out(alu_out)
    );

    
    reg_16bit RegisterC (
        .clk(clk),
        .rst(reset),
        .ld(loadC),
        .data_in(alu_out),
        .q(regC_out)
    );

    
    data_memory DM (
        .clk(clk),
        .addr(ir_address),
        .data_in(regC_out),
        .write_en(we_DM),
        .data_out(dm_out)
    );

endmodule

