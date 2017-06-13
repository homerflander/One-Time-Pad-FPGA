`timescale 1ns / 1ps
module CU(input rst1, input start, input clk, output reg rst2,
output reg rstreg, output reg ren, 
output reg shift, output reg [1:0] sel1, output reg wen, 
output reg [1:0] wa, output reg [1:0] ra1, output reg [1:0] ra2, 
output reg [2:0] sel2, output reg done, output reg [6:0] cs);

//reg [6:0] cs;
reg [6:0] ns;
reg [15:0] ctrl;
integer loop;

always@(posedge clk, posedge rst1)
begin
    if(rst1==1)
    begin
        cs=0;
    end
    else if(start==1)
    begin
        if(cs==0||cs==4||cs==12)
            loop=6;
        if(cs==1||cs==5||cs==13)
            loop=loop-1;
        cs=ns;
    end
end

always@(cs, loop)
begin
    case(cs)
    6'd00:ns=1;
    6'd01:
    begin
        if(loop==0)
        ns=2;
        else
        ns=1;
    end
    6'd02:ns=3;
    6'd03:ns=4;
    6'd04:ns=5;
    6'd05:
    begin
        if(loop==0)
        ns=6;
        else
        ns=5;
    end
    6'd06:ns=7;
    6'd07:ns=8;
    6'd08:ns=9;
    6'd09:ns=10;
    6'd10:ns=11;
    6'd11:ns=12;
    6'd12:ns=13;
    6'd13:
    begin
        if(loop==0)
        ns=14;
        else
        ns=13;
    end
    6'd14:ns=15;
    6'd15:ns=16;
    6'd16:ns=17;
    6'd17:ns=12;
    endcase
end

always@(cs)
begin
case(cs)
    6'd00:
    begin
        ctrl=16'b0110000000000001;
        done=0; 
    end
    6'd01:ctrl=16'b1001000000000100;
    6'd02:ctrl=16'b1000000000000100;
    6'd03:ctrl=16'b0000101000000100;
    6'd04:ctrl=16'b0010000000000010;
    6'd05:ctrl=16'b1001000000000100;
    6'd06:ctrl=16'b1000000000000100;
    6'd07:ctrl=16'b0000101010001100;
    6'd08:ctrl=16'b0000111100001110;
    6'd09:ctrl=16'b0000010000010110;
    6'd10:ctrl=16'b0000110000010110;
    6'd11:ctrl=16'b0000110010010110;
    6'd12:
    begin
    ctrl=16'b0010000000000011;
    done=0;
    end
    6'd13:ctrl=16'b1001000000000100;
    6'd14:ctrl=16'b1000000000000100;
    6'd15:ctrl=16'b0000101101000100;
    6'd16:ctrl=16'b0000111111100110;
    6'd17:
    begin
    ctrl=16'b0000000001100101;
    done=1;
    end
endcase
{ren, rst2, rstreg, shift, wen, sel1, wa, ra1, ra2, sel2}=ctrl;
end

endmodule
