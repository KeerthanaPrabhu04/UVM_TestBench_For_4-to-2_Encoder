interface encoder_if(input logic clk, input logic reset);
  // Define communication signals
  logic [3:0] data_in;  // Input data to be encoded
  logic [1:0] data_out; // Encoded output based on data_in
endinterface
