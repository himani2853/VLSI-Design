`include "add_sub.v"
`timescale 1ns/1ns

module add_sub_testbench;
    reg [3:0] A; 
    reg [3:0] B;
    reg M;
    wire [3:0] S;
    wire C_final;

    add_sub call1 (
        .C_final(C_final),
        .S(S),
        .A(A),
        .B(B),
        .M(M)
        
         );

  initial begin
    $dumpfile("add_sub_testbench.vcd");
    $dumpvars(0, add_sub_testbench);
end

    initial begin
        M = 1'b0;
        A = 4'b0001;
        B = 4'b0000;
        #10

        M = 1'b0;
        A = 4'b0001;
        B = 4'b0001;
        #10

        M = 1'b0;
        A = 4'b0011;
        B = 4'b0011;
        #10

        M = 1'b1;
        A = 4'b1111;
        B = 4'b1001;
        #10

        M = 1'b1;
        A = 4'b0111;
        B = 4'b1001;
        #10

        
        $finish;
    end

    initial begin
   $monitor(" A = %b",A," B = %b",B," M = %b",M," CARRY = %b",C_final," SUM/DIFFERENCE = %b",S);
   end

endmodule


