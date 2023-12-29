module enable
(
    output [3:0]Y_A,
    output [3:0]Y_B,
    input [3:0]A,
    input [3:0]B,
    input enab
    
);

    and G0(Y_A[0],A[0],enab);
    and G1(Y_A[1],A[1],enab);
    and G2(Y_A[2],A[2],enab);
    and G3(Y_A[3],A[3],enab);

    and G4(Y_B[0],B[0],enab);
    and G5(Y_B[1],B[1],enab);
    and G6(Y_B[2],B[2],enab);
    and G7(Y_B[3],B[3],enab);
    
endmodule