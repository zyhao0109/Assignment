function x = tridiagonal_solver(a, b, c, d)
    % a, b, c 分别是三对角线方程组的系数
    % d 是方程组右侧的常数项
    
    n = length(d);
    
    % Forward elimination
    for i = 2:n
        factor = a(i) / b(i-1);
        b(i) = b(i) - factor * c(i-1);
        d(i) = d(i) - factor * d(i-1);
    end
    
    % Backward substitution
    x = zeros(n, 1);
    x(n) = d(n) / b(n);
    
    for i = n-1:-1:1
        x(i) = (d(i) - c(i) * x(i+1)) / b(i);
    end
end
