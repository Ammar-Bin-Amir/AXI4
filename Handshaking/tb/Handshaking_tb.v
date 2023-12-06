`timescale 1ns/1ns

module handshaking_tb;
    
    reg clk;
    reg rst;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire valid;
    wire ready;

    handshaking uut(clk,rst,data_in,data_out,valid,ready);

    initial begin
        $dumpfile("./temp/Handshaking_tb.vcd");
        $dumpvars(0,handshaking_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        data_in = 8'b0101_1010;
        #10 rst = 0;
        #25 rst = 1;
        #50 rst = 0;
        #200 data_in = 8'b1010_0101;
        #100 data_in = 8'b0000_0000;
        #50 data_in = 8'b1111_1111;
        #1000 $finish;
    end

endmodule