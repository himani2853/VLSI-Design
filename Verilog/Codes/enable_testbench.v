`include "enable.v"
`timescale 1ns/1ns

module enable_testbench;
    reg [3:0] A; 
    reg [3:0] B;
    reg enab;
    wire [3:0] Y_A;
    wire [3:0] Y_B;
    
    enable call1 (
        .Y_A(Y_A),
        .Y_B(Y_B),
        .A(A),
        .B(B),
        .enab(enab)
        );

  initial begin
    $dumpfile("enable_testbench.vcd");
    $dumpvars(0, enable_testbench);
end
  
    initial begin
        enab = 1'b0;
        A = 4'b1110;
        B = 4'b0100;
        #10
        enab = 1'b1;
        A = 4'b1110;
        B = 4'b0101;
        #10
     
        
        $finish;
    end
    
    initial begin
   $monitor(" A = %b",A," B = %b",B," enable = %b",enab," A_FINAL = %b",Y_A," B_FINAL = %b",Y_B);
   end

endmodule
