% Max matrix element value
max_val = 2^50;
% Create 100 test cases
for i = 1:100
    % Random dimensions for matrices A and B
    row_dim_A = randi(10);
    col_dim_A = randi(10);
    row_dim_B = randi(10);
    col_dim_B = randi(10);

    % Create zero matrices for edge cases
    zero_matrix_A = zeros(row_dim_A, col_dim_A);
    zero_matrix_B = zeros(row_dim_B, col_dim_B);

    % Random numbers for edge case determination
    edge_case_A = rand();
    edge_case_B = rand();

    % Random matrix A with appropriate element sizes
    rand_mat_A = max_val .* rand(row_dim_A, col_dim_A);
    rand_helper_A = (-1) .^ randi(2, row_dim_A, col_dim_A);
    rand_mat_A = rand_mat_A .* rand_helper_A;

    % Set edge case(s) for matrix A if random edge case condition is met
    if edge_case_A < 0.1
        rand_mat_A = zero_matrix_A;
    end

    % Random matrix B with appropriate element sizes
    rand_mat_B = max_val .* rand(row_dim_B, col_dim_B);
    rand_helper_B = (-1) .^ randi(2, row_dim_B, col_dim_B);
    rand_mat_B = rand_mat_B .* rand_helper_B;

    % Set edge case(s) for matrix B if random edge case condition is met
    if edge_case_B < 0.1
        rand_mat_B = zero_matrix_B;
    end

    % Set file names for serialization
    file_name_A = 'kron_matrix_A.txt';
    file_name_B = 'kron_matrix_B.txt';
    file_name_ans = 'kron_answers.txt';

    % Test MATLAB kron function
    kron_out = kron(rand_mat_A, rand_mat_B);

    % Serialize results
    serialize_matrix(file_name_A, rand_mat_A);
    serialize_matrix(file_name_B, rand_mat_B);
    serialize_matrix(file_name_ans, kron_out);
end