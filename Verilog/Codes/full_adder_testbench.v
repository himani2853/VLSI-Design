`include "full_adder.v"
`timescale 1ns/1ns

module full_adder_testbench;
    reg  A; 
    reg  B;
    reg C_IN;
    wire SUM;
    wire C_OUT;

    full_adder call1 (
        .SUM(SUM),
        .C_OUT(C_OUT),
        .A(A),
        .B(B),
        .C_IN(C_IN)
        
         );

  initial begin
    $dumpfile("full_adder_testbench.vcd");
    $dumpvars(0, full_adder_testbench);
end

  
    initial begin
        C_IN = 1'b0;
        A = 1'b1;
        B = 1'b0;
        #10

        C_IN = 1'b0;
        A = 1'b1;
        B = 1'b1;
        #10

        C_IN = 1'b0;
        A = 1'b0;
        B = 1'b1;
        #10

        C_IN = 1'b0;
        A = 1'b0;
        B = 1'b0;
        #10

        // M = 1'b1;
        // A = 4'b0001;
        // B = 4'b0001;
        // #10
        // A = 4'b0001;
        // B = 4'b0001;
        // #10
        // A = 4'b1011;
        // B = 4'b1111;
        // #10


        
        $finish;
    end

    initial begin
   $monitor(" A = %b",A," B = %b",B," C_IN = %b",C_IN," CARRY = %b",C_OUT," SUM/DIFFERENCE = %b",SUM);
   end

endmodule
