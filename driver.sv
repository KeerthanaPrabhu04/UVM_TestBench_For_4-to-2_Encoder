class driver;
  virtual encoder_if vif;
  mailbox gen_to_drv;
  transaction tr;

  // Constructor
  function new(mailbox gen_to_drv, virtual encoder_if vif);
    this.gen_to_drv = gen_to_drv;
    this.vif = vif;
  endfunction

  task run();
  // Drive input transactions to DUT
	forever begin
    // Wait for enable signal
      @(posedge vif.clk);
      gen_to_drv.get(tr);
      vif.data_in <= tr.data_in;
      @(posedge vif.clk);
      tr.data_out <= vif.data_out;
	end

  endtask
endclass
