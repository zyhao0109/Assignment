% 指定矩阵的阶数
n = 41;  

% 创建一个n阶矩阵
A = zeros(n);

% 设置主对角线为6
A(1:n+1:end) = 6;

% 设置对角线上相邻的对角线为8
A(2:n+1:end) = 8;

% 设置对角线下相邻的对角线为1
A(n+1:n+1:end) = 1;

% 假设 A 是三对角线方程组的系数矩阵

% 下对角线
a = diag(A, -1);
a(end + 1) = 8;
% 主对角线
d = diag(A);

% 上对角线
c = diag(A, 1);
c(end + 1) = 1;

b = ones(n,1) * 15;
b(1) = 7;  % 第一个元素为 7
b(end) = 14;  % 最后一个元素为 14


x = tridiagonal_solver(a, d, c, b);
disp(x);

