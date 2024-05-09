class transaction;
    // Define transaction variables
    bit [3:0] data_in;
    bit [1:0] data_out;

    // Constraint to limit input data to valid values
    constraint ip_c {
        data_in >= 4'b0001; // Minimum valid input
        data_in <= 4'b1000; // Maximum valid input
    }
endclass
