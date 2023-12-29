`include "full_adder.v"
module add_sub
(
    output C_final,
    output [3:0]S,
    input [3:0]A,
    input [3:0]B, 
    input M
);

   wire t0,t1,t2,t3;
   wire [2:0]c_inc;
   wire C_out;
   xor G0(t0,B[0],M);
   full_adder FA0(S[0],c_inc[0],A[0],t0,M);
   xor G1(t1,B[1],M);
   full_adder FA1(S[1],c_inc[1],A[1],t1,c_inc[0]);
   xor G2(t2,B[2],M);
   full_adder FA2(S[2],c_inc[2],A[2],t2,c_inc[1]);
   xor G3(t3,B[3],M);
   full_adder FA3(S[3],C_out,A[3],t3,c_inc[2]);
//    and G4(C_final,~C_out,M);
   xor G4(C_final,C_out,M);

endmodule

// 1111
// 0110
// 0111
// 1_0110

// 0111->7
// 1001->9
// 0110
// 0111
// 1110
