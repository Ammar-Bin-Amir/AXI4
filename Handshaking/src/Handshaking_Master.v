module handshaking_master (
    input clk,
    input rst,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output reg valid_out,
    input ready_in
);
    
    always @(posedge clk) begin
        if (rst) begin
            valid_out <= 0;
        end
        else begin
            data_out <= data_in;
            if (data_out) begin
                valid_out <= 1;
                if (ready_in) begin
                    valid_out <= 0;
                end
            end
        end
    end

endmodule