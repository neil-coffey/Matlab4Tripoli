% Max matrix element values
max_val1 = 2^30;
max_val2 = 2^30;

% Create 100 test cases
for i = 1:100
    % Random dimensions for matrices A and B
    row_dim1 = randi(10);
    col_dim1 = randi(10);
    row_dim2 = randi(10);
    col_dim2 = randi(10);

    % Random numbers for edge case determination
    edge_case1 = rand();
    edge_case2 = rand();

    % Random matrix A creation
    rand_mat1 = max_val1 .* rand(row_dim1, col_dim1);
    rand_helper1 = (-1) .^ randi(2, row_dim1, col_dim1);
    rand_mat1 = rand_mat1 .* rand_helper1;

    % Set file names for serialization
    file_name1 = 'rDivide_matrix_A.txt';

    % Random matrix B creation (1x1 matrix)
    rand_mat2 = max_val2 .* rand(1, 1);
    rand_helper2 = (-1) .^ randi(2, 1, 1);
    rand_mat2 = rand_mat2 .* rand_helper2;

    % Set file names for serialization
    file_name2 = 'rDivide_matrix_B.txt';

    % Test MATLAB rdivide function
    rdivide_out = rdivide(rand_mat1, rand_mat2(1));
    
    % Set file names for serialization
    file_name3 = 'rDivide_answers.txt';

    % Serialize matrices and output using the serialize_matrix function
    serialize_matrix(file_name1, rand_mat1);
    serialize_matrix(file_name2, rand_mat2);
    serialize_matrix(file_name3, rdivide_out);
end