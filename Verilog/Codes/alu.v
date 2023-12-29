`include "and.v"
`include "comparator.v"
`include "add_sub.v"
`include "enable.v"
`include "decoder.v"

module alu_final (
    input [1:0]S,
    input [3:0]A,
    input [3:0]B,
    output carry,
    output borrow,
    output [3:0]FINAL_SUM,
    output [3:0]FINAL_DIFF,
    output [2:0]COMPARE,
    output [3:0]AND,
    output FINAL_CARRY_BORROW,
    output [3:0]FINAL_OUTPUT
    

);
    reg [3:0] FINAL_OUTPUT;
    reg FINAL_CARRY_BORROW;
    wire [3:0]Y_A_0;
    wire [3:0]Y_A_1;
    wire [3:0]Y_A_2;
    wire [3:0]Y_A_3;
    wire [3:0]Y_B_0;
    wire [3:0]Y_B_1;
    wire [3:0]Y_B_2;
    wire [3:0]Y_B_3;
    wire [3:0]D;
    wire [2:0] Compare;

    // Decoder
    decoder D1(D,S);
    // Enable
    enable E0(Y_A_0,Y_B_0,A,B,D[0]); 
    enable E1(Y_A_1,Y_B_1,A,B,D[1]);
    enable E2(Y_A_2,Y_B_2,A,B,D[2]);
    enable E3(Y_A_3,Y_B_3,A,B,D[3]);
    // Add_Sub
    add_sub AS0(carry,FINAL_SUM,Y_A_0,Y_B_0,S[0]);
    add_sub AS1(borrow,FINAL_DIFF,Y_A_1,Y_B_1,S[0]);
    // Comparator
    comparator CM(COMPARE,Y_A_2,Y_B_2);
    
    //*****USE WHEN U WANT TO SHOW ALL OUTPUTS*******//
    // comparator CM(comp,Y_A_2,Y_B_2);
    // and check1(COMPARE[0],comp[0],D[2]);
    // and check2(COMPARE[1],comp[1],D[2]);
    // and check3(COMPARE[2],comp[2],D[2]);

    // AND 
    and_gate AN(AND,Y_A_3,Y_B_3);
     always @(*) begin
        case(D)
            4'b0001: FINAL_OUTPUT = {FINAL_SUM[3:0]};
            4'b0010: FINAL_OUTPUT = {FINAL_DIFF[3:0]};
            4'b0100: FINAL_OUTPUT[2:0] = COMPARE[2:0];
            4'b1000: FINAL_OUTPUT[3:0] = AND[3:0];
            default: FINAL_OUTPUT = 4'bxxxx; 
        endcase
        case (D)
            4'b0001: FINAL_CARRY_BORROW = {carry};
            4'b0010: FINAL_CARRY_BORROW = {borrow}; 
            default: FINAL_CARRY_BORROW = 1'bx;
        endcase
    end

    
endmodule

