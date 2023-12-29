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
    output [3:0]AND
);
    wire [3:0]Y_A_0;
    wire [3:0]Y_A_1;
    wire [3:0]Y_A_2;
    wire [3:0]Y_A_3;
    wire [3:0]Y_B_0;
    wire [3:0]Y_B_1;
    wire [3:0]Y_B_2;
    wire [3:0]Y_B_3;
    wire [3:0]D;
    wire [2:0]comp;
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
    comparator CM(comp,Y_A_2,Y_B_2);
    and check1(COMPARE[0],comp[0],D[2]);
    and check2(COMPARE[1],comp[1],D[2]);
    and check3(COMPARE[2],comp[2],D[2]);

    // AND 
    and_gate AN(AND,Y_A_3,Y_B_3);
    
endmodule