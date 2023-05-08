% Max matrix element value
max_val = 2^25;

% Create 100 test cases
for i = 1:100
    % Random row and col dimensions
    row_dim = randi(10);

    % Create a zero matrix (edge case)
    zero_matrix = zeros(row_dim, row_dim);
    edge_case = rand();

    % Random matrix with appropriate element sizes and dimensions
    rand_mat = max_val .* rand(row_dim, row_dim);
    rand_helper = (-1) .^ randi(2, row_dim, row_dim);
    rand_mat = rand_mat .* rand_helper;

    % Set edge case(s) if random edge case condition is met
    if edge_case < 0.1
        rand_mat = zero_matrix;
    end

    % Set file names for serialization
    file_name1 = 'exp_matrix_A.txt';
    file_name2 = 'exp_answers.txt';

    % Test MATLAB matrix exponentiation (element-wise squaring)
    exp_out = rand_mat .^ 2;

    % Serialize results
    serialize_matrix(file_name1, rand_mat);
    serialize_matrix(file_name2, exp_out);
end