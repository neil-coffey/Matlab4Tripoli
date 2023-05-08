% Max matrix element value
max_val = 2^30;

% Create 100 test cases
for i = 1:100
    % Random dimensions for the matrices
    row_dim = randi(11) - 1;
    col_dim = randi(10);
    row_dim2 = randi(10);
    col_dim2 = randi(10);

    % Zero matrices for edge case(s)
    zero_matrix1 = zeros(1, 2);

    % Random numbers for edge case determination
    edge_case1 = rand();

    % Random matrix with appropriate element sizes
    rand_mat = max_val .* rand(1, 2);
    rand_helper = (-1) .^ randi(2, 1, 2);
    rand_mat = rand_mat .* rand_helper;

    % Set edge case(s) if random edge case condition is met
    if edge_case1 < 0.1
        rand_mat = zero_matrix1;
    end

    % Set file names for serialization
    file_name1 = 'linspace_matrix_A.txt';
    file_name3 = 'linspace_answers.txt';

    % Test MATLAB linspace function
    linspace_out = linspace(rand_mat(1), rand_mat(2), row_dim);

    % Serialize results
    serialize_matrix(file_name1, [rand_mat, row_dim]);
    serialize_matrix(file_name3, linspace_out);
end