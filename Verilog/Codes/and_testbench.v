`include "and.v"
`timescale 1ns/1ns

module and_testbench;
    reg [3:0] A; 
    reg [3:0] B;
    wire [3:0] T;
    
    and_gate call1 (
        .T(T),
        .A(A),
        .B(B)
         );


  initial begin
    $dumpfile("and_testbench.vcd");
    $dumpvars(0, and_testbench);
end

    initial begin
        A = 4'b0000;
        B = 4'b0000;
        #10
        A = 4'b0001;
        B = 4'b0000;
        #10
        A = 4'b0001;
        B = 4'b0001;
        #10
        A = 4'b1011;
        B = 4'b1001;
        #10


        
        $finish;
    end

    initial begin
   $monitor(" A = %b",A," B = %b",B," AND = %b",T);
   end

endmodule
