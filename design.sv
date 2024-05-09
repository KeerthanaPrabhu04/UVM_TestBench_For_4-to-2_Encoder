module encoder(
  input logic clk,
  input logic reset,
  input logic [3:0] data_in,   // Input data to be encoded
  output logic [1:0] data_out  // Encoded output based on data_in
);

  // Sequential logic to encode input data
  always @(posedge clk, posedge reset) begin
    if (reset) begin
      data_out <= 2'b00; // Reset to initial state
    end 
    else begin
      case (data_in)
        4'b0001: data_out <= 2'b00;
        4'b0010: data_out <= 2'b01;
        4'b0100: data_out <= 2'b10;
        4'b1000: data_out <= 2'b11;
        default: data_out <= 2'bxx; // Reset to default state on invalid input
      endcase
    end
  end
endmodule
