% Max matrix element value
max_val = 2^50;
% Create 100 test cases
for i = 1:100
    % Random row and col dimensions
    row_dim = randi(10);
    col_dim = randi(10);

    % Create a zero matrix matching row and col dimensions (edge case)
    zero_matrix = zeros(row_dim, col_dim);

    % Random number for edge case determination
    edge_case = rand();

    % Random matrix with appropriate element sizes and dimensions
    rand_mat = max_val .* rand(row_dim, col_dim);
    rand_helper = (-1) .^ randi(2, row_dim, col_dim);
    rand_mat = rand_mat .* rand_helper;

    % Set edge case(s) if random edge case condition is met
    if edge_case < 0.1
        rand_mat = zero_matrix;
    end

    % Set file names for serialization
    file_name1 = 'size_matrix_A.txt';
    file_name3 = 'size_answers.txt';

    % Calculate matrix size
    rand_mat_size = size(rand_mat);

    % Test MATLAB size function
    size_out = rand_mat_size;

    % Serialize results
    serialize_matrix(file_name1, rand_mat);
    serialize_matrix(file_name3, size_out);
end