`timescale 1ns / 1ps
module DP_TB();

reg [7:0] in;
reg clk, rst, rstreg, ren, shift, wen, rst2;
reg [1:0] sel1, wa, ra1, ra2; 
reg [2:0] sel2; 
wire [63:0] out;
reg [15:0] ctrl;
integer loop;

DP u0(.in(in), .clk(clk), .rst1(rst), .rst2(rst2), .rstreg(rstreg), .ren(ren), 
.shift(shift), .sel1(sel1), .wen(wen), .wa(wa),
.ra1(ra1), .ra2(ra2), .sel2(sel2), 
.out(out));
initial
begin
    //load up msg to be       64'b1010101010101010101010101010101010101010101010101010101010101010
    //next load up key to be  64'b1111111111111111111111111111111111111111111111111111111111111111
    rst=1;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    #50;
    rst=0;
    
    ctrl=16'b0110000000000001;//idle state 0
    {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    #50;
    loop=7;//set loop to 7
    while(loop!=0)
    begin
        in=8'b10101010;
        ctrl=16'b1001000000000100;//input msg1-7 state 1
        {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
        clk=0;
        #50;
        clk=1;
        #50;
        clk=0;
        #50;
        loop=loop-1;
    end
   ctrl=16'b1000000000000100;//input msg8 state 2
    {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    #50;
    ctrl=16'b0000101000000100;//write to regfile state 3
    {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    #50;
    loop=7;//reset loop
    ctrl=16'b0010000000000010;//display put pass and reset shift reg state 4 
    {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    #50;
    while(loop!=0)
    begin
        in=8'b11111111;
        ctrl=16'b1001000000000100;//input pass1-7 state 5
        {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
        clk=0;
        #50;
        clk=1;
        #50;
        clk=0;
        #50;
        loop=loop-1;
    end
    ctrl=16'b1000000000000100;//input pass8 state 6
    {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    #50;
    ctrl=16'b0000101010001100;//write to regfile state 7
    {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    #50;
    ctrl=16'b0000111100001110;//write to xor to regfile state 8
    {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    ctrl=16'b0000010000010110;//wait state 9
    {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    ctrl=16'b0000110000010110;//clear msg state 10
    {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    ctrl=16'b0000110010010110;//clear pass state 11
    {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    ctrl=16'b0010000000000011;//put try and reset shiftreg state 12
    {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    loop=7;//reset loop to 7
    while(loop!=0)
    begin
        in=8'b11111111;
        ctrl=16'b1001000000000100;//input try1-7 state 13
        {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
        clk=0;
        #50;
        clk=1;
        #50;
        clk=0;
        #50;
        loop=loop-1;
    end
    ctrl=16'b1000000000000100;//input try8 state 14
    {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    #50;
    ctrl=16'b0000101101000100;//write try to regfile state 15
    {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    #50;
    ctrl=16'b0000111111000110;//write xor regfile state 16
    {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    ctrl=16'b0000000001100101;//done, show cipher state 17
    {ren, rst, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    #50;
    if(out==64'b1010101010101010101010101010101010101010101010101010101010101010)
    begin
        $display ("ONE-TIME PAD DP_TB PASSED");
        #50 $stop;
        #20 $finish;
    end
    else
    begin
        $display ("ONE-TIME PAD DP_TB FAILED");
        #50 $stop;
        #20 $finish;
    end

end
endmodule
