% Given data points
x = [1 2 2.5 3 4 5]; 
f = [0 5 7 6.5 2 0]; 
x_interp = 3.4; % Point to interpolate

% Newton's Interpolation (Order 1 to 3)
x_newton = [2.5, 3, 4, 5];  
f_newton = [7, 6.5, 2, 0];  

% Compute divided differences
n = length(x_newton);
div_diff = zeros(n, n);
div_diff(:,1) = f_newton';

for j = 2:n
    for i = 1:n-j+1
        div_diff(i, j) = (div_diff(i+1, j-1) - div_diff(i, j-1)) / (x_newton(i+j-1) - x_newton(i));
    end
end

% Compute interpolated value using Newton's method
N_interp = div_diff(1,1);
product_term = 1;

for j = 2:4  
    product_term = product_term * (x_interp - x_newton(j-1));
    N_interp = N_interp + div_diff(1, j) * product_term;
end

fprintf('Newton Interpolation at x = %.2f: %.4f\n', x_interp, N_interp);

% Lagrange Interpolation
L_interp = 0;
for i = 1:n
    L_term = f_newton(i);
    for j = 1:n
        if i ~= j
            L_term = L_term * (x_interp - x_newton(j)) / (x_newton(i) - x_newton(j));
        end
    end
    L_interp = L_interp + L_term;
end

fprintf('Lagrange Interpolation at x = %.2f: %.4f\n', x_interp, L_interp);
