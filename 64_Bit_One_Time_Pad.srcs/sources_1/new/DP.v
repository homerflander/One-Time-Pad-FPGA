`timescale 1ns / 1ps

module DP(input [7:0] in, input clk, input rst1, input rst2,
input rstreg, input ren, 
input shift, input [1:0] sel1, input wen, input [1:0] wa,
input [1:0] ra1, input [1:0] ra2, input [2:0] sel2, 
output [63:0] out);

wire [63:0] shiftout;
wire [63:0] ro1;
wire [63:0] ro2;
wire [63:0] xorout;
wire [63:0] mux1out;

shift8reg u0(.in(in), .en(ren), .rst1(rst1), .rst2(rst2),
.rst3(rstreg), .clk(clk), .shiftL8(shift), .out(shiftout));

mux1 u1(.sel(sel1), .in0(64'b0000000000000000000000000000000000000000000000000000000000000000), 
.in1(shiftout), .in2(ro2), .in3(xorout),
.out(mux1out));

regfile u2(.in(mux1out), .wen(wen), .wa(wa),
.ra1(ra1), .ra2(ra2), .rst(rst1), .clk(clk),
.ro1(ro1), .ro2(ro2));

mux2 u3(.sel(sel2), .in0(64'b0000000000000000000000000000000000000000000000000000000000000000),
.in1({64'b0000100100001110000100000001010100010100000011010001001100000111}),
.in2({64'b0001000000010101000101000000000000010000000000010001001100010011}),
.in3({64'b0001000000010101000101000000000000010100000100100001100100000000}),
.in4(shiftout), .in5(ro1),
.in6({64'b0001011100000001000010010001010000000000000000000000000000000000}), .out(out));

XOR u4(.in1(ro1), .in2(ro2), 
.out(xorout));

endmodule
