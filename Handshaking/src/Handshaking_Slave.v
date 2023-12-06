module handshaking_slave (
    input clk,
    input rst,
    input [7:0] data_in,
    input valid_in,
    output reg ready_out
);
    
    reg [7:0] data_save;

    always @(posedge clk) begin
        if (rst) begin
            ready_out <= 0;
            data_save <= 0;
        end
        else begin
            // ready_out <= 1;
            if (valid_in) begin
                ready_out <= 1;
                if (ready_out) begin
                   data_save <= data_in;
                end
            end
            else if (valid_in == 0) begin
                ready_out <= 0;
            end
        end
    end

endmodule