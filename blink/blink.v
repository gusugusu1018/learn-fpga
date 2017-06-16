`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/15 22:58:32
// Design Name: 
// Module Name: blink
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


module blink(
    input CLK,
    input RST,
    output reg [0:3] LED
    );
   
reg [22:0] cnt23;

// 23 bit counter
always @( posedge CLK ) begin
    if ( RST )
        cnt23 <= 23'h0;
    else
        cnt23 <= cnt23 + 1'h1;
end

// output of 23 bit counter is ALL 1
wire ledcnten = (cnt23==23'h7fffff);

reg [2:0] cnt3;

always @( posedge CLK ) begin
    if ( RST )
        cnt3 <= 3'h0;
    else if ( ledcnten )
        if ( cnt3==3'd5 )
            cnt3 <= 3'h0;
        else
            cnt3 <= cnt3 + 1'h1;
end

always @* begin
    case ( cnt3 )
        3'd0:       LED = 4'b0001;
        3'd1:       LED = 4'b0010;
        3'd2:       LED = 4'b0100;
        3'd3:       LED = 4'b1000;
        3'd4:       LED = 4'b0100;
        3'd5:       LED = 4'b0010;
        default:    LED = 4'b0000;
    endcase
end

endmodule
