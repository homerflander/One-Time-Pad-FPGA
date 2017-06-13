`timescale 1ns / 1ps
module regfile(input [63:0] in, input wen, input [1:0] wa,
input [1:0] ra1, input [1:0] ra2, input rst, input clk,
output reg [63:0] ro1, output reg [63:0] ro2);

reg [63:0] mem [3:0];

always@(posedge clk, posedge rst)
begin
    if(wen)
        mem[wa]=in;
    ro1=mem[ra1];
    ro2=mem[ra2];
    if(rst)
    begin
        mem[0]=0;
        mem[1]=0;
        mem[2]=0;
        mem[3]=0;
    end
end

endmodule
