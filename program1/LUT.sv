module LUT(
    input           [2:0] addr,
    output logic    [7:0] target
);

always_comb begin
    case(addr)
        3'b000: target = 8'b10001110;
        3'b001: target = 8'b01101101;
        3'b010: target = 8'b01011011;
        3'b011: target = 8'b00000101;
        3'b100: target = 8'b00010111;
        3'b101: target = 8'b00000001;
        default: target = 8'b00000000;
    endcase
end

endmodule