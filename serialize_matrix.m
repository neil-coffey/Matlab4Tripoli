function serialize_matrix(filename, matrix)
    % Create the full file path
    full_filename = fullfile(filename);

    % Transpose matrix and calculate its size
    matrix = transpose(matrix);
    matrix_size = size(matrix);

    % Open the file for appending
    fid = fopen(full_filename, 'a');

    % Write the matrix size header
    fprintf(fid, '%fx%f,', matrix_size(1), matrix_size(2));

    % Write the matrix elements
    for k = 1:numel(matrix)
        fprintf(fid, '%f,', matrix(k));
    end

    % Write a newline character at the end
    fprintf(fid, '\n');

    % Close the file
    fclose(fid);
end