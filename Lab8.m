% Given Data
x = [0.6, 1.5, 1.6, 2.5, 3.5]; 
f = [0.9036, 0.3734, 0.3261, 0.08422, 0.01596];

% True derivative function
syms X
f_true = 5 * exp(-2*X) * X;  
df_true = diff(f_true, X);   
df_actual = double(subs(df_true, X, x)); 

% Compute numerical derivatives
df_numeric = zeros(size(x));

% Forward difference (first point)
df_numeric(1) = (f(2) - f(1)) / (x(2) - x(1));

% Backward difference (last point)
df_numeric(end) = (f(end) - f(end-1)) / (x(end) - x(end-1));

% Central difference (interior points)
for i = 2:length(x)-1
    df_numeric(i) = (f(i+1) - f(i-1)) / (x(i+1) - x(i-1));
end

% Display results
fprintf(' x       Numerical df/dx    True df/dx    Error\n');
fprintf('-------------------------------------------------\n');
for i = 1:length(x)
    fprintf('%5.2f   %10.6f   %10.6f   %10.6f\n', x(i), df_numeric(i), df_actual(i), abs(df_numeric(i) - df_actual(i)));
end
