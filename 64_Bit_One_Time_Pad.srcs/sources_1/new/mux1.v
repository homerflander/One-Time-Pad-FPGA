`timescale 1ns / 1ps
module mux1(input [1:0] sel, input [63:0] in0, 
input [63:0] in1, input [63:0] in2, input [63:0] in3,
output reg [63:0] out);
begin
    always@(*)
    begin
        case(sel)
        2'b00: out=in0;
        2'b01: out=in1;
        2'b10: out=in2;
        2'b11: out=in3;
        endcase
    end
end
endmodule
