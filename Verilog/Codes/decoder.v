module decoder
(
  
    output [3:0]D,
    input [1:0]A
    

);

  
    and G1(D[0],~A[0],~A[1]);
    and G2(D[1],A[0],~A[1]);
    and G3(D[2],~A[0],A[1]);
    and G4(D[3],A[1],A[0]);

endmodule