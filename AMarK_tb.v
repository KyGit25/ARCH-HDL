// Maristela, Kyle Gabriel A. - S18

// Testbench for Structural even up-down binary counter using D Flip-Flops
module AMarK_tb();
    wire [3:0] t_state;
    reg t_y, t_clock, t_reset;

    // instantiate dut
    AMarK dut(t_state[3], t_state[2], t_state[1], t_state[0], t_y, t_clock, t_reset);

    // generate clock
    initial 
        begin
            t_clock = 1'b0;
            forever #5 t_clock = ~t_clock;
        end
    
    // reset sequence
    initial 
        begin
            t_reset = 1'b0;
            #10 t_reset = 1'b1;
        end

    // input y testing
    initial 
        begin
            t_y = 1'b0;
            #100 t_y = 1'b1;
        end

    // End simulation
    initial #200 $finish;

    // Display results
    initial 
        begin
            $display("Kyle Gabriel A. Maristela, Structural even up-down Binary counter using D Flip-Flops");
            $monitor("time=%03d  clock=%b  reset=%b  y=%b  state=%b", $time, t_clock, t_reset, t_y, t_state);
            $dumpfile("AMarK.vcd");
            $dumpvars();
        end
endmodule