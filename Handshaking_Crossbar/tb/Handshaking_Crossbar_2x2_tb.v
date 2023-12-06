`timescale 1ns/1ns

module handshaking_xbar_2x2_tb;
    
    reg clk;
    reg rst;
    // Master 1
    reg [7:0] data_out_m1;
    reg valid_out_m1;
    wire ready_in_m1;
    // Master 2
    reg [7:0] data_out_m2;
    reg valid_out_m2;
    wire ready_in_m2;
    // Slave 1
    wire [7:0] data_in_s1;
    wire valid_in_s1;
    reg ready_out_s1;
    // Slave 2
    wire [7:0] data_in_s2;
    wire valid_in_s2;
    reg ready_out_s2;

    handshaking_xbar_2x2 uut(
        clk,
        rst,
        data_out_m1,
        valid_out_m1,
        ready_in_m1,
        data_out_m2,
        valid_out_m2,
        ready_in_m2,
        data_in_s1,
        valid_in_s1,
        ready_out_s1,
        data_in_s2,
        valid_in_s2,
        ready_out_s2
    );

    initial begin
        $dumpfile("./temp/Handshaking_Crossbar_2x2_tb.vcd");
        $dumpvars(0,handshaking_xbar_2x2_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        #10 rst = 0;
        #10 rst = 1;
        // M1 ---> S1
        #50 data_out_m1 = 8'h20; valid_out_m1 = 1; ready_out_s1 = 1;
        #50 data_out_m1 = 8'h28; valid_out_m1 = 0; ready_out_s1 = 0;
        #50 data_out_m1 = 8'h2f; valid_out_m1 = 1; ready_out_s1 = 1;
        #50 data_out_m1 = 8'h0f; valid_out_m1 = 0; ready_out_s1 = 0;
        // M1 ---> S2
        #50 data_out_m1 = 8'h30; valid_out_m1 = 1; ready_out_s2 = 1;
        #50 data_out_m1 = 8'h38; valid_out_m1 = 0; ready_out_s2 = 0;
        #50 data_out_m1 = 8'h3f; valid_out_m1 = 1; ready_out_s2 = 1;
        #50 data_out_m1 = 8'h1f; valid_out_m1 = 0; ready_out_s2 = 0;
        // M2 ---> S1
        #50 data_out_m2 = 8'h20; valid_out_m2 = 1; ready_out_s1 = 1;
        #50 data_out_m2 = 8'h28; valid_out_m2 = 0; ready_out_s1 = 0;
        #50 data_out_m2 = 8'h2f; valid_out_m2 = 1; ready_out_s1 = 1;
        #50 data_out_m2 = 8'h4f; valid_out_m2 = 0; ready_out_s1 = 0;
        // M2 ---> S2
        #50 data_out_m2 = 8'h30; valid_out_m2 = 1; ready_out_s2 = 1;
        #50 data_out_m2 = 8'h38; valid_out_m2 = 0; ready_out_s2 = 0;
        #50 data_out_m2 = 8'h3f; valid_out_m2 = 1; ready_out_s2 = 1;
        #50 data_out_m2 = 8'h5f; valid_out_m2 = 0; ready_out_s2 = 0;
        // M1 ---> S1 & M2 ---> S2
        #50 data_out_m1 = 8'h20; valid_out_m1 = 1; ready_out_s1 = 1;
        #25 data_out_m2 = 8'h30; valid_out_m2 = 0; ready_out_s2 = 0;
        #50 data_out_m1 = 8'h28; valid_out_m1 = 0; ready_out_s1 = 0;
        #25 data_out_m2 = 8'h38; valid_out_m2 = 1; ready_out_s2 = 1;
        #50 data_out_m1 = 8'h2f; valid_out_m1 = 1; ready_out_s1 = 1;
        #25 data_out_m2 = 8'h3f; valid_out_m2 = 0; ready_out_s2 = 0;
        #50 data_out_m1 = 8'h6f; valid_out_m1 = 0; ready_out_s1 = 0; data_out_m2 = 8'h7f; valid_out_m2 = 1; ready_out_s2 = 1;
        // M1 ---> S2 & M2 ---> S1
        #50 data_out_m1 = 8'h30; valid_out_m1 = 1; ready_out_s2 = 1;
        #25 data_out_m2 = 8'h20; valid_out_m2 = 0; ready_out_s1 = 0;
        #50 data_out_m1 = 8'h38; valid_out_m1 = 0; ready_out_s2 = 0;
        #25 data_out_m2 = 8'h28; valid_out_m2 = 1; ready_out_s1 = 1;
        #50 data_out_m1 = 8'h3f; valid_out_m1 = 1; ready_out_s2 = 1;
        #25 data_out_m2 = 8'h2f; valid_out_m2 = 0; ready_out_s1 = 0;
        #50 data_out_m1 = 8'h8f; valid_out_m1 = 0; ready_out_s2 = 0; data_out_m2 = 8'h9f; valid_out_m2 = 1; ready_out_s1 = 1;
        // M1 & M2 ---> S1
        #50 data_out_m1 = 8'h20; valid_out_m1 = 1; ready_out_s1 = 1; data_out_m2 = 8'h22; valid_out_m2 = 1; ready_out_s1 = 1;
        #50 data_out_m1 = 8'h26; valid_out_m1 = 1; ready_out_s1 = 1; data_out_m2 = 8'h2a; valid_out_m2 = 1; ready_out_s1 = 1;
        #50 data_out_m1 = 8'h2f; valid_out_m1 = 1; ready_out_s1 = 1; data_out_m2 = 8'h2d; valid_out_m2 = 1; ready_out_s1 = 1;
        #50 data_out_m1 = 8'haf; valid_out_m1 = 1; ready_out_s1 = 1; data_out_m2 = 8'hbf; valid_out_m2 = 1; ready_out_s1 = 1;
        // M1 & M2 ---> S2
        #50 data_out_m1 = 8'h30; valid_out_m1 = 1; ready_out_s2 = 1; data_out_m2 = 8'h32; valid_out_m2 = 1; ready_out_s2 = 1;
        #50 data_out_m1 = 8'h36; valid_out_m1 = 1; ready_out_s2 = 1; data_out_m2 = 8'h3a; valid_out_m2 = 1; ready_out_s2 = 1;
        #50 data_out_m1 = 8'h3f; valid_out_m1 = 1; ready_out_s2 = 1; data_out_m2 = 8'h3d; valid_out_m2 = 1; ready_out_s2 = 1;
        #50 data_out_m1 = 8'hcf; valid_out_m1 = 1; ready_out_s2 = 1; data_out_m2 = 8'hdf; valid_out_m2 = 1; ready_out_s2 = 1;
        // M2 & M1 ---> S1
        #50 data_out_m2 = 8'h20; valid_out_m2 = 1; ready_out_s1 = 1; data_out_m1 = 8'h22; valid_out_m1 = 1; ready_out_s1 = 1;
        #50 data_out_m2 = 8'h26; valid_out_m2 = 1; ready_out_s1 = 1; data_out_m1 = 8'h2a; valid_out_m1 = 1; ready_out_s1 = 1;
        #50 data_out_m2 = 8'h2f; valid_out_m2 = 1; ready_out_s1 = 1; data_out_m1 = 8'h2d; valid_out_m1 = 1; ready_out_s1 = 1;
        #50 data_out_m2 = 8'he0; valid_out_m2 = 1; ready_out_s1 = 1; data_out_m1 = 8'he2; valid_out_m1 = 1; ready_out_s1 = 1;
        // M2 & M1 ---> S2
        #50 data_out_m2 = 8'h30; valid_out_m2 = 1; ready_out_s2 = 1; data_out_m1 = 8'h32; valid_out_m1 = 1; ready_out_s2 = 1;
        #50 data_out_m2 = 8'h36; valid_out_m2 = 1; ready_out_s2 = 1; data_out_m1 = 8'h3a; valid_out_m1 = 1; ready_out_s2 = 1;
        #50 data_out_m2 = 8'h3f; valid_out_m2 = 1; ready_out_s2 = 1; data_out_m1 = 8'h3d; valid_out_m1 = 1; ready_out_s2 = 1;
        #50 data_out_m2 = 8'he1; valid_out_m2 = 1; ready_out_s2 = 1; data_out_m1 = 8'he3; valid_out_m1 = 1; ready_out_s2 = 1;
        #1000 $finish;
    end

endmodule