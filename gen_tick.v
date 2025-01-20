//=========================================================================
// Name & Email must be EXACTLY as in Gradescope roster!
// Name: Rosendo Marquez
// Email: rmarq030@ucr.edu
// 
// Assignment name:  Lab 01 - Clocks and Test Benches
// Lab section: 
// TA: 
// 
// I hereby certify that I have not received assistance on this assignment,
// or used code, from ANY outside source other than the instruction team
// (apart from what was provided in the starter file).
//
//=========================================================================

module gen_tick # ( parameter SRC_FREQ = 5000, parameter TICK_FREQ = 1) (
    input src_clk,
    input enable,
    output tick
);

    // # clock cycles for one tick - SRC_FREQ / TICK_FREQ
    // to have the number of cycle we get (1/2) * SRC_FREQ / TICK_FREQ 
    // subtract when 1 as 0 starts

    integer counter_size = (SRC_FREQ / (2*TICK_FREQ));
    reg output_tick = 0; 
    integer counter = 0; 

    always @(posedge src_clk) begin
        if (enable) begin
            if (counter >= counter_size) 
            begin
                //reset counter and flip output bit
                //non blocking logic 
                counter <= 1;
                output_tick <= ~output_tick; 
            end 
            else
             begin
                counter <= counter + 1;
            end
        end
    end
    assign tick = output_tick;

endmodule
