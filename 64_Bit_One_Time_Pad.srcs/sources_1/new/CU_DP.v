`timescale 1ns / 1ps

module CU_DP(input [7:0] in, input clk, input rst, input start,
output [63:0] out, output [6:0] cs, output done);

wire ren, shift, wen, rstreg, rst2;
wire [1:0] sel1, wa, ra1, ra2; 
wire [2:0] sel2; 

CU u0(.rst1(rst), .start(start), .clk(clk), .rst2(rst2), .rstreg(rstreg), .ren(ren), 
.shift(shift), .sel1(sel1), .wen(wen), 
.wa(wa), .ra1(ra1), .ra2(ra2), 
.sel2(sel2), .done(done), .cs(cs));


DP u1(.in(in), .clk(clk), .rst1(rst), .rst2(rst2), .rstreg(rstreg), .ren(ren), 
.shift(shift), .sel1(sel1), .wen(wen), .wa(wa),
.ra1(ra1), .ra2(ra2), .sel2(sel2), 
.out(out));

endmodule
