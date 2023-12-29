module and_gate 
(
    output [3:0]T,
    input wire [3:0]A,
    input wire [3:0]B    
);

    and G0(T[0],A[0],B[0]);
    and G1(T[1],A[1],B[1]);
    and G2(T[2],A[2],B[2]);
    and G3(T[3],A[3],B[3]);
    
endmodule