function [x, iterations] = jacobi_solver(A, b, tolerance, max_iterations)
    % Input:
    %   A: 系数矩阵
    %   b: 右侧向量
    %   tolerance: 允许误差
    %   max_iterations: 最大迭代次数
    % Output:
    %   x: 方程组的解向量
    %   iterations: 实际迭代次数

    % 获取方程组的大小
    n = length(b);

    % 初始化解向量
    x = zeros(n, 1);

    % 迭代
    for iterations = 1:max_iterations
        x_old = x;

        % 遍历方程组的每一个方程
        for i = 1:n
            sigma = A(i, :) * x_old - A(i, i) * x_old(i);
            x(i) = (b(i) - sigma) / A(i, i);
        end

        % 计算误差
        error = norm(x - x_old, inf);

        % 检查是否满足终止条件
        if error < tolerance
            return;
        end
    end

    % 如果达到最大迭代次数仍未满足终止条件，输出警告信息
    warning('Jacobi iteration did not converge within the specified number of iterations.');
end
