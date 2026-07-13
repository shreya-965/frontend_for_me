`timescale 1ns / 1ns

module TB();

reg clk = 0;
reg reset_0 = 1;

always #5 clk = ~clk;

// UART
wire uart_tx;
reg uart_rx = 1'b1;      // idle state

// Other signals
wire fio0, fio1, fio2, fio3, CS, SCK, trap;
wire [3:0] gpio_io_o_0;

// UART monitor outputs
wire [7:0] recv_data;
wire data_valid_rcv;

specparam tdevice_PU = 3e8; // 300 ms

//------------------------------------------
// DUT
//------------------------------------------
design_1_wrapper dut(
    .usb_uart_rxd(uart_rx),
    .usb_uart_txd(uart_tx),
    .clk_in1_0(clk),
    .resetn_0(reset_0),
    .qspi_flash_io0_io(fio0),
    .qspi_flash_io1_io(fio1),
    .qspi_flash_io2_io(fio2),
    .qspi_flash_io3_io(fio3),
    .qspi_flash_sck_io(SCK),
    .qspi_flash_ss_io(CS),
    .trap_0(trap),
    .led_4bits_tri_io(gpio_io_o_0)
);

//------------------------------------------
// Flash model
//------------------------------------------
s25fl128s flash_memory(
    .SI(fio0),
    .SO(fio1),
    .SCK(SCK),
    .CSNeg(CS),
    .RSTNeg(reset_0),
    .WPNeg(fio2),
    .HOLDNeg(fio3)
);

//------------------------------------------
// UART monitor for SoC TX
//------------------------------------------
uart_rx rcv(
    .clk(clk),
    .resetn(reset_0),
    .rx(uart_tx),
    .data_out(recv_data),
    .data_valid(data_valid_rcv)
);

//------------------------------------------
// Reset
//------------------------------------------
initial begin
    reset_0 = 0;
    #tdevice_PU;
    #10;
    reset_0 = 1;
end

//------------------------------------------
// Print UART output
//------------------------------------------
reg firmware_ready = 0;

always @(posedge clk) begin
    if (data_valid_rcv) begin

        $display("UART RX: %x", recv_data);

        if (recv_data == 8'hFF) begin
            firmware_ready <= 1;
            $display("Firmware waiting for host command");
        end
    end
end

//------------------------------------------
// UART TX task (Host -> SoC)
//------------------------------------------
parameter BIT_PERIOD = 8680; // 115200 baud

task uart_send_byte;
    input [7:0] data;
    integer i;
begin
    // Start bit
    uart_rx = 1'b0;
    #(BIT_PERIOD);

    // 8 data bits, LSB first
    for(i=0;i<8;i=i+1) begin
        uart_rx = data[i];
        #(BIT_PERIOD);
    end

    // Stop bit
    uart_rx = 1'b1;
    #(BIT_PERIOD);
end
endtask

//------------------------------------------
// Host behavior
//------------------------------------------
//------------------------------------------
// Host behavior
//------------------------------------------
initial begin

    uart_rx = 1'b1;

    // Wait for reset release
    wait(reset_0 == 1);

    // Wait until firmware sends 0xFF
    wait(firmware_ready == 1);

    #100000;

    //----------------------------------
    // Send invalid command
    //----------------------------------
    $display("\nHOST -> Sending 0x20");
    uart_send_byte(8'h20);

    #1000000;

    //----------------------------------
    // Send Batch 5
    //----------------------------------
    firmware_ready = 0;
   $display("\nHOST -> Sending 0x05");
   uart_send_byte(8'h05);

    // Wait until firmware loops back
    wait(firmware_ready == 1);

   #100000;

    //----------------------------------
    // Send Default Dataset
    //----------------------------------
    firmware_ready = 0;
    $display("\nHOST -> Sending 0x10");
    uart_send_byte(8'h10);

    //Wait until firmware loops back
    wait(firmware_ready == 1);

    #100000;
  
    //----------------------------------
    // Send Batch 10
    //----------------------------------
    firmware_ready = 0;
    $display("\nHOST -> Sending 0x0A");
    uart_send_byte(8'h0A);

end
endmodule