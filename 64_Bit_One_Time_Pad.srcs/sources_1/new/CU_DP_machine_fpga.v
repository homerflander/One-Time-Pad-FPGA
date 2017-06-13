`timescale 1ns / 1ps
module CU_DP_machine_fpga(
input [7:0] A,
input B,
output [7:0] C,
input [4:0] D,
output [4:0] E,
input clk100MHz, 
input rst, 
output [7:0] LEDOUT, 
output [7:0] LEDSEL); 
wire [7:0] TOT1, TOT2, TOT3, TOT4, TOT5, TOT6, TOT7, TOT8;
wire debounce;
supply1[7:0] vcc;
 
wire m0, m1, m2, m3, m4, m5, m6, m7;  
wire n0, n1, n2, n3, n4, n5, n6, n7;  
wire o0, o1, o2, o3, o4, o5, o6, o7; 
wire p0, p1, p2, p3, p4, p5, p6, p7;
wire q0, q1, q2, q3, q4, q5, q6, q7;
wire r0, r1, r2, r3, r4, r5, r6, r7;
wire s0, s1, s2, s3, s4, s5, s6, s7;
wire t0, t1, t2, t3, t4, t5, t6, t7;
  
wire DONT_USE, clk_5KHz; 

clk_gen u1(.clk100MHz(clk100MHz), .rst(rst), .clk_4sec(DONT_USE), .clk_5KHz(clk_5KHz));

button_debouncer u2(clk_5KHz, B, debounce);

CU_DP u3(.in(A), .clk(debounce), .rst(D[3]), .start(D[4]),
.out({TOT1,TOT2,TOT3,TOT4,TOT5,TOT6,TOT7,TOT8}), .cs(cs), .done(done));

assign E=D;
assign C=A;

sevenseg u4(TOT1,m0, m1, m2, m3, m4, m5, m6); 
sevenseg u5(TOT2,n0, n1, n2, n3, n4, n5, n6); 
sevenseg u6(TOT3,o0, o1, o2, o3, o4, o5, o6); 
sevenseg u7(TOT4,p0, p1, p2, p3, p4, p5, p6); 
sevenseg u8(TOT5,q0, q1, q2, q3, q4, q5, q6); 
sevenseg u9(TOT6,r0, r1, r2, r3, r4, r5, r6); 
sevenseg u10(TOT7,s0, s1, s2, s3, s4, s5, s6); 
sevenseg u11(TOT8,t0, t1, t2, t3, t4, t5, t6); 

led_mux u12(clk_5KHz, rst, {m7, m6, m5, m4, m3, m2, m1, m0}, 
{n7, n6, n5, n4, n3, n2, n1, n0}, {o7, o6, o5, o4, o3, o2, o1, o0}, 
{p7, p6, p5, p4, p3, p2, p1, p0}, {q7, q6, q5, q4, q3, q2, q1, q0}, 
{r7, r6, r5, r4, r3, r2, r1, r0}, {s7, s6, s5, s4, s3, s2, s1, s0},
{t7, t6, t5, t4, t3, t2, t1, t0},LEDOUT, LEDSEL); 

endmodule 

