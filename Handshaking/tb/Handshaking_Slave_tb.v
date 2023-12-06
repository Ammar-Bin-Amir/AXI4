`timescale 1ns/1ns

module handshaking_slave_tb;
    
    reg clk,rst;
    reg [7:0] data_in;
    reg valid_in;
    wire ready_out;

    handshaking_slave uut(clk,rst,data_in,valid_in,ready_out);

    initial begin
        $dumpfile("./temp/Handshaking_Slave_tb.vcd");
        $dumpvars(0,handshaking_slave_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        data_in = 8'b1101_0100;
        #10 rst = 0;
        #10 rst = 1;
        #10 rst = 0;
        #50 valid_in = 1;
        #50 valid_in = 0;
        #50 data_in = 8'b0100_1101;
        #50 valid_in = 1;
        #50 valid_in = 0;
        #50 data_in = 8'b0000_0000;
        #50 valid_in = 1;
        #50 valid_in = 0;
        #50 data_in = 8'b1111_1111;
        #1000 $finish;
    end

endmodule