`timescale 1ns/1ns

module handshaking_master_tb;
    
    reg clk,rst;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire valid_out;
    reg ready_in;

    handshaking_master uut(clk,rst,data_in,data_out,valid_out,ready_in);

    initial begin
        $dumpfile("./temp/Handshaking_Master_tb.vcd");
        $dumpvars(0,handshaking_master_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        data_in = 8'b1001_0110;
        #10 rst = 0;
        #10 rst = 1;
        #10 rst = 0;
        #50 ready_in = 1;
        #50 ready_in = 0;
        #50 data_in = 8'b0110_1001;
        #50 ready_in = 1;
        #50 ready_in = 0;
        #50 data_in = 8'b0000_0000;
        #50 ready_in = 1;
        #50 ready_in = 0;
        #50 data_in = 8'b1111_1111;
        #1000 $finish;
    end

endmodule