`include "alu_final.v"
`timescale 1ns/1ns

module alu_final_testbench;
    reg [1:0] S;
    reg [3:0] A; 
    reg [3:0] B;
    wire carry;
    wire borrow;
    wire [3:0] FINAL_SUM;
    wire [3:0] FINAL_DIFF;
    wire [2:0]COMPARE;
    wire [3:0]AND;

    alu_final call1 (

        .S(S),
        .A(A),
        .B(B),
        .carry(carry),
        .borrow(borrow),
        .FINAL_SUM(FINAL_SUM),
        .FINAL_DIFF(FINAL_DIFF),
        .COMPARE(COMPARE),
        .AND(AND)
    );

  initial begin
    $dumpfile("alu_final_testbench.vcd");
    $dumpvars(0, alu_final_testbench);
end

    initial begin
        A = 4'b0110;
        B = 4'b0010;
    end

    initial begin
        S = 2'b00;
        // A = 4'b0011;
        // B = 4'b0011;
        #10
         S = 2'b01;
        // A = 4'b1000;
        // B = 4'b1000;
        #10
         S = 2'b10;
        // A = 4'b0110;
        // B = 4'b0010;
        #10
         S = 2'b11;
        // A = 4'b0010;
        // B = 4'b0011;
        #10
        //  S = 2'b10;
        // A = 4'b0011;
        // B = 4'b0011;
        // #10


        
        $finish;
    end

    initial begin
   $monitor($time," S1 = %b",S[1]," S0 = %b",S[0]," A = %b",A," B = %b",B," CARRY = %b",carry," BORROW = %b",borrow," SUM = %b",FINAL_SUM," DIFFERENCE = %b",FINAL_DIFF," COMPARE = %b",COMPARE," AND = %b",AND);
    //   $monitor(" S1 = %b",S[1]," S0 = %b",S[0]," A = %b",A," B = %b",B," FINAL OUTPUT = %b",FINAL_OUTPUT," FINAL_CARRY_BORROW = ",FINAL_CARRY_BORROW);
   end


endmodule
