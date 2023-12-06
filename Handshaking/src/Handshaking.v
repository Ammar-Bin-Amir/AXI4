module handshaking (
    input clk,
    input rst,
    input [7:0] data_in,
    output [7:0] data_out,
    output valid,
    output ready
);

    handshaking_master uut_master(
        .clk (clk),
        .rst (rst),
        .data_in (data_in),
        .data_out (data_out),
        .valid_out (valid),
        .ready_in (ready)
    );

    handshaking_slave uut_slave(
        .clk (clk),
        .rst (rst),
        .data_in (data_out),
        .valid_in (valid),
        .ready_out (ready)
    );
    
endmodule