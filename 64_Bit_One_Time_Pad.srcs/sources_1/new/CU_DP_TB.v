`timescale 1ns / 1ps

module CU_DP_TB();
reg [7:0] in;
reg clk, rst, start;
wire done;
wire [63:0] out;
wire[6:0] cs;

CU_DP u0(.in(in), .clk(clk), .rst(rst), .start(start),
.out(out), .cs(cs), .done(done));
initial
begin
rst=1;
#50;
clk=0;
#50;
clk=1;
#50;
clk=0;
#50;
rst=0;

while(done!=1)
begin
    start=1;
    if(cs==1||cs==2)
        in=8'b10101010;
    if(cs==5||cs==6||cs==13||cs==14)
        in=8'b11111111;     
    #50;
    clk=0;
    #50;
    clk=1;
    #50;
    clk=0;
    #50;      
end
#100;
if(out==64'b1010101010101010101010101010101010101010101010101010101010101010)
begin
    $display ("ONE-TIME PAD CU_DP_TB PASSED");
    #50 $stop;
    #20 $finish;
end
else
begin
    $display ("ONE-TIME PAD CU_DP_TB FAIL");
    #50 $stop;
    #20 $finish;
end

end
endmodule
