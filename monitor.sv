class monitor;
  virtual encoder_if vif;
  mailbox mon_to_sb;

  // Constructor
  function new(mailbox mon_to_sb,virtual encoder_if vif);
    this.vif = vif;
    this.mon_to_sb= mon_to_sb;
  endfunction

  // Monitor task
  task run();
  // Monitor DUT's output
    forever begin
      transaction mon_tr;
      wait(!vif.reset);
     // Wait for rising edge of clock
      @(posedge vif.clk);
      mon_tr= new();
      mon_tr.data_in=vif.data_in;
      @(posedge vif.clk);
      mon_tr.data_out=vif.data_out;
      mon_to_sb.put(mon_tr);
    end
           
  endtask
endclass
