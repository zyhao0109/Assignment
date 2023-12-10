% 指定矩阵的阶数
n = 1000;  

% 创建一个n阶矩阵
A = zeros(n);

% 设置主对角线为6
A(1:n+1:end) = 6;

% 设置对角线上相邻的对角线为8
A(2:n+1:end) = 8;

% 设置对角线下相邻的对角线为1
A(n+1:n+1:end) = 1;



b = ones(n,1) * 15;
b(1) = 7;  % 第一个元素为 7
b(end) = 14;  % 最后一个元素为 14

max_iterations = 1000000;
tolerance = 1e-6;

x = gauss_seidel_solver(A, b, max_iterations, tolerance);
disp(x);
