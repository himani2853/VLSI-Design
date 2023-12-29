`include "decoder.v"
`timescale 1ns/1ns

module decoder_testbench;
    reg [1:0] A; 
    wire [3:0] D;
    
    decoder call1 (
        .D(D),
        .A(A)
        );

  initial begin
    $dumpfile("decoder_testbench.vcd");
    $dumpvars(0, decoder_testbench);
end
    initial begin
        
        A = 2'b00;
        #10
        A = 2'b01;
        #10
        A = 2'b10;
        #10
        A = 2'b11;
        #10
     
        
        $finish;
    end

    initial begin
   $monitor(" A = %b",A," D = %b",D);
   end

endmodule
