clc;
clear;
close all;

% Define function F(x) = x^10 - 1
F = @(x) x.^10 - 1;

% Define interval [a, b]
a = 0;
b = 1.3;
tolerance = 1e-6;  % Define tolerance
max_iter = 100;     % Maximum iterations

% Bisection Method
iter = 0;
while (b - a) / 2 > tolerance && iter < max_iter
    xm = (a + b) / 2;  % Midpoint
    if F(xm) == 0
        break;  % Exact root found
    elseif F(a) * F(xm) < 0
        b = xm;  % Root lies in left subinterval
    else
        a = xm;  % Root lies in right subinterval
    end
    iter = iter + 1;
end

% Display results
fprintf('Root found at x = %.6f after %d iterations\n', xm, iter);
