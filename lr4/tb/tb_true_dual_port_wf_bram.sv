`timescale 1ns/1ps

module tb_true_dual_port_wf_bram;

  localparam RAM_WIDTH     =  8;
  localparam RAM_ADDR_BITS = 10;
  localparam AMOUNT_VALUES = 10;

  logic                         clk_i;
  logic [RAM_ADDR_BITS - 1 : 0] addr_a;
  logic [RAM_ADDR_BITS - 1 : 0] addr_b;
  logic [RAM_WIDTH     - 1 : 0] write_data_a;
  logic [RAM_WIDTH     - 1 : 0] write_data_b;
  logic                         we_a;
  logic                         we_b;
  logic                         en_a;
  logic                         en_b;
  logic [RAM_WIDTH     - 1 : 0] read_data_a;
  logic [RAM_WIDTH     - 1 : 0] read_data_b;

  true_dual_port_wf_bram #(
    .RAM_WIDTH     ( RAM_WIDTH     ),
    .RAM_ADDR_BITS ( RAM_ADDR_BITS ) 
  ) bram_init (
    .clk_i    (clk_i),
    .addr_a_i (addr_a),
    .addr_b_i (addr_b),
    .data_a_i (write_data_a),
    .data_b_i (write_data_b),
    .we_a_i   (we_a),
    .we_b_i   (we_b),
    .en_a_i   (en_a),
    .en_b_i   (en_b),
    .data_a_o (read_data_a),
    .data_b_o (read_data_b)
  );

  // =======================
  //  CLOCK GENERATION 
  // =======================
  initial begin
                 clk_i <= 1'b0;
    forever #(1) clk_i <= ~clk_i;
  end

  // =======================
  //  EXECUTION
  // =======================
  initial begin
    $display( "\nStart test: \n\n==========================\nCLICK THE BUTTON 'Run All'\n==========================\n"); $stop();
    fork
      check_write_port_a();
      check_write_port_b();
    join
    $display("\n The test is over \n See the signals on the waveform \n");
    $finish;
  end
  
  // =======================
  //  TASKS
  // =======================
  task check_write_port_a;
    begin
      en_a <= 1'b1;
      for (int i = 0; i < AMOUNT_VALUES; i++) begin
        void'(std::randomize(addr_a) with { addr_a inside {[0:5]}; });
        write_data_a <= $urandom();
        void'(std::randomize(we_a) with {
          we_a dist {
            0 :/ 1,
            1 :/ 4
          };
        });
        @(posedge clk_i);
        #(1)
        if (we_a) assert (read_data_a === write_data_a)           else  $display("Time: %t, PORT A: rd = %h, wd = %h", $time(), read_data_a, write_data_a);
        else      assert (read_data_a === bram_init.bram[addr_a]) else  $display("Time: %t, PORT A: rd = %h, wd = %h", $time(), read_data_a, bram_init.bram[addr_a]);
      end
    end
  endtask

  task check_write_port_b;
    begin
      en_b <= 1'b1;
      for (int i = 0; i < AMOUNT_VALUES; i++) begin
        void'(std::randomize(addr_b) with { addr_b inside {[0:5]}; });
        write_data_b <= $urandom();
        void'(std::randomize(we_b) with {
          we_b dist {
            0 :/ 1,
            1 :/ 4
          };
        });
        @(posedge clk_i);
        #(1)
        if (we_b) assert (read_data_b === write_data_b)           else  $display("Time: %t, PORT A: rd = %h, wd = %h", $time(), read_data_b, write_data_b);
        else      assert (read_data_b === bram_init.bram[addr_b]) else  $display("Time: %t, PORT A: rd = %h, wd = %h", $time(), read_data_b, bram_init.bram[addr_b]);
      end
    end
  endtask

endmodule