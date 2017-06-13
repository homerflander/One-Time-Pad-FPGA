`timescale 1ns / 1ps
module mux2(input [2:0] sel, input [63:0] in0,
input [63:0] in1, input [63:0] in2, input [63:0] in3,
input [63:0] in4, input [63:0] in5, input [63:0] in6,
output reg [63:0] out);
begin
    always@(*)
    begin
        case(sel)
        3'b000: out=in0;
        3'b001: out=in1;
        3'b010: out=in2;
        3'b011: out=in3;
        3'b100: out=in4;
        3'b101: out=in5;
        3'b110: out=in6;
        endcase
    end
end

endmodule
