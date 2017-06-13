`timescale 1ns / 1ps
module XOR(input [63:0] in1, input [63:0] in2, 
output [63:0] out);
assign out=in1^in2;
endmodule
