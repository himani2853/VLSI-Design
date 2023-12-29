module full_adder
(
    output SUM,C_OUT,
    input A, B,C_IN
    
);

   wire t0,t1,t2;

   xor G0(t0,A,B);
   xor G1(SUM,t0,C_IN);
   and G2(t1,t0,C_IN);
   and G3(t2,A,B);
   or G4(C_OUT,t1,t2);
    
endmodule