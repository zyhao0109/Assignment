function x = gaussElimination(A, b)
  
    [m, n] = size(A);

    % 增广矩阵 [A | b]
    augmentedMatrix = [A, b];

    % 高斯消元过程
    for k = 1:min(m, n)
        % 列主元素选取
        [~, maxRow] = max(abs(augmentedMatrix(k:m, k)));
        maxRow = maxRow + k - 1;

        % 交换当前行和最大主元所在行
        augmentedMatrix([k, maxRow], :) = augmentedMatrix([maxRow, k], :);

        % 消元
        for i = k + 1:m
            factor = augmentedMatrix(i, k) / augmentedMatrix(k, k);
            augmentedMatrix(i, k:n+1) = augmentedMatrix(i, k:n+1) - factor * augmentedMatrix(k, k:n+1);
        end
    end

    % 回代过程
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = augmentedMatrix(i, n+1) / augmentedMatrix(i, i);
        for j = i-1:-1:1
            augmentedMatrix(j, n+1) = augmentedMatrix(j, n+1) - augmentedMatrix(j, i) * x(i);
        end
    end
end
