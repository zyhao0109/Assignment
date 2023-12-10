function x = gauss_seidel_solver(A, b, max_iterations, tolerance)
    % A 是系数矩阵
    % b 是右侧常数向量
    % max_iterations 是最大迭代次数
    % tolerance 是收敛容限
    
    n = length(b);
    x = zeros(n, 1);
    
    for k = 1:max_iterations
        x_old = x;
        
        for i = 1:n
            sigma1 = A(i, 1:i-1) * x(1:i-1);
            sigma2 = A(i, i+1:end) * x_old(i+1:end);
            x(i) = (b(i) - sigma1 - sigma2) / A(i, i);
        end
        
        % 检查是否满足收敛条件
        if norm(x - x_old, inf) < tolerance
            fprintf('高斯-赛德尔迭代法在 %d 次迭代后收敛\n', k);
            return;
        end
    end
    
    error('高斯-赛德尔迭代法未能在指定迭代次数内收敛');
end
