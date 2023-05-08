% Create 100 test cases
for i = 1:100
    % Generate random parameters
    row_dim = randi(10);
    lower_bound = rand() * 100;
    upper_bound = lower_bound + rand() * 100;
    num_segments = randi([2, 10]);
    basis_degree = randi([2, 10]);
    num_points = num_segments + basis_degree - 1;
    x = linspace(lower_bound, upper_bound, num_points)';

    % Create matrices A and B
    matrix_A = round(x, 8);
    matrix_B = [lower_bound, upper_bound, num_points, num_segments, basis_degree];

    % Calculate the bspline matrix
    bspline_matrix = bbase(x, lower_bound, upper_bound, num_segments, basis_degree);
    bspline_matrix = round(bspline_matrix, 8);

    % Set file names for serialization
    file_name1 = 'bspline_matrix_A.txt';
    file_name2 = 'bspline_matrix_B.txt';
    file_name3 = 'bspline_answers.txt';

    % Serialize matrices using the serialize_matrix function
    serialize_matrix(file_name1, matrix_A);
    serialize_matrix(file_name2, matrix_B);
    serialize_matrix(file_name3, bspline_matrix);
end