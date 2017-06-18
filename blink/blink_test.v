`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/18 12:58:25
// Design Name: 
// Module Name: blink_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module blink_test;

localparam STEP = 8;
localparam  CLKNUM = 1000*5;

reg CLK;
reg RST;
wire [0:3]   LED;

blink blink(
    .CLK    (CLK),
    .RST    (RST),
    .LED    (LED)
);

always begin
    CLK = 0; #(STEP/2);
    CLK = 1; #(STEP/2);
end

initial begin
                RST =0;
    #(STEP*500) RST=1;
    #(STEP*10)  RST=0;
    #(STEP*CLKNUM);
    $stop;
end

endmodule
