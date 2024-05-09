`include "interface.sv"
`include "base_test.sv"

module testbench;
  bit clk, reset;


  // Instantiate interface
  encoder_if vif(clk,reset);

  // Instantiate DUT
  encoder DUT(
    .clk(vif.clk),
    .reset(vif.reset),
    .data_in(vif.data_in),
    .data_out(vif.data_out)
  );


  // Instantiate base test
  base_test t1(vif);

  // Clock generation
  always #1 clk = ~clk;

  // Initial reset
  initial begin
    clk = 1;
    reset = 1;
    #5;
    reset = 0;
    #20;
  end

  initial begin
    //Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(0);
    $dumpflush();
  end
endmodule
