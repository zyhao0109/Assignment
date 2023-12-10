function x = gaussian_elimination(A, b)
    % 将系数矩阵A和右侧向量b合并成增广矩阵
    augmented_matrix = [A, b];

    % 行数和列数
    [rows, cols] = size(augmented_matrix);

    % 高斯消元过程
    for i = 1:rows
        % 将当前列的对角线元素缩放为1
        diag_element = augmented_matrix(i, i);
        augmented_matrix(i, :) = augmented_matrix(i, :) / diag_element;

        % 对当前列的其他行进行消元操作，使得当前列的元素变为0
        for j = 1:rows
            if i ~= j
                factor = augmented_matrix(j, i);
                augmented_matrix(j, :) = augmented_matrix(j, :) - factor * augmented_matrix(i, :);
            end
        end
    end

    % 提取解
    x = augmented_matrix(:, end);

    disp('方程组的解为:');
    disp(x);
end



