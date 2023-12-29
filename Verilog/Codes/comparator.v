module comparator (
    output [2:0]CM,
    input [3:0]A,
    input [3:0]B
    
);

//    CM[0] --> A<B
//    CM[1] --> A=B
//    CM[2] --> A>B
//    CM[3] --> X

    wire t1,t2,t3,t4;
    wire s4,s1,s2,s3;
    wire r4,r1,r2,r3;

    // A=B
    xnor G0(t4,A[0],B[0]);
    xnor G1(t1,A[1],B[1]);
    xnor G2(t2,A[2],B[2]);
    xnor G3(t3,A[3],B[3]);
    and G6(CM[1],t4,t1,t2,t3);

    // A>B
    and H0(s3,A[3],~B[3]);
    and H1(s1,A[2],~B[2],t3);
    and H2(s2,A[1],~B[1],t2,t3);
    and H3(s4,A[0],~B[0],t1,t2,t3);
    or H4(CM[2],s1,s2,s3,s4);

    // A<B
    and I0(r3,~A[3],B[3]);
    and I1(r1,~A[2],B[2],t3);
    and I2(r2,~A[1],B[1],t3,t2);
    and I3(r4,~A[0],B[0],t3,t2,t1);
    or I4(CM[0],r1,r2,r3,r4);

endmodule


