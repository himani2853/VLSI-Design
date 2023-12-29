`include "comparator.v"
`timescale 1ns/1ns

module comparator_testbench;
    reg [3:0] A; 
    reg [3:0] B;
    wire [2:0] CM;
    
    comparator call1 (
        .CM(CM),
        .A(A),
        .B(B)
         );

  initial begin
    $dumpfile("comparator_testbench.vcd");
    $dumpvars(0, comparator_testbench);
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
        B = 4'b1111;
        #10


        
        $finish;
    end

    initial begin
   $monitor(" A = %b",A," B = %b",B," COMPARE = %b",CM);
   end

endmodule
