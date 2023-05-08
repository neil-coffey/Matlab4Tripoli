% Max matrix element value
max_val = 2^50;
% Create 100 test cases
for i = 1:100
    % Random row dimension (col is 1, since Java code only looks at 1 row)
    row_dim = randi(10);

    % Create a zero matrix matching row dim (edge case)
    zero_matrix = zeros(row_dim, 1);

    % Random number for edge case determination
    edge_case = rand();

    % Random matrix with appropriate element sizes and row dimension
    rand_mat = max_val .* rand(row_dim, 1);
    rand_helper = (-1) .^ randi(2, row_dim, 1);
    rand_mat = rand_mat .* rand_helper;

    % Set edge case(s) if random edge case condition is met
    if edge_case < 0.1
        rand_mat = zero_matrix;
    end

    % Set file names for serialization
    file_name1 = 'diag_matrix_A.txt';
    file_name3 = 'diag_answers.txt';

    % Test MATLAB diag function
    diag_out = diag(rand_mat);

    % Serialize results
    serialize_matrix(file_name1, rand_mat);
    serialize_matrix(file_name3, diag_out);
end