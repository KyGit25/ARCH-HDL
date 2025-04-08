// Maristela, Kyle Gabriel A. - S18

// Structural even up-down binary counter with D Flip-Flop implementation
module FF_D(Q, D, clock, reset);
    output reg Q;
    input D, clock, reset;

    // D Flip-Flop with asynchronous active-low reset
    always @(posedge clock or negedge reset) 
        begin
            if (!reset) 
                Q <= 1'b0;
            else 
                Q <= D;
        end
endmodule

module AMarK(A, B, C, D, y, clock, reset);
    output A, B, C, D;
    input y, clock, reset;
    wire DA, DB, DC, DD; 

    // assignment of D FF inputs
    assign DA = ((~B & ~C & ~D & ~y) | (B & C & ~D & y));;
    assign DB = ((~C & ~D & ~y) | (C & ~D & y));
    assign DC = ~D;
    assign DD = 1'b0;

    // Instantiation of D FF
    FF_D F1(A, DA, clock, reset);
    FF_D F2(B, DB, clock, reset);
    FF_D F3(C, DC, clock, reset);
    FF_D F4(D, DD, clock, reset);
endmodule