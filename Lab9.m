% Define function
f = @(x) (1 - x - 4*x.^3 + 2*x.^5);

% Limits of integration
a = -2;
b = 4;

% (a) Analytical Integration
syms x
f_sym = 1 - x - 4*x^3 + 2*x^5;
I_analytical = int(f_sym, x, a, b);
I_analytical = double(I_analytical);
fprintf('(a) Analytical Integral: %.6f\n', I_analytical);

% (b) Single Application of the Trapezoidal Rule
I_trap_single = (b-a) * (f(a) + f(b)) / 2;
fprintf('(b) Trapezoidal Rule (Single Application): %.6f\n', I_trap_single);

% (c) Composite Trapezoidal Rule (n = 2 and n = 4)
n_values = [2, 4];
for n = n_values
    x_vals = linspace(a, b, n+1);
    h = (b - a) / n;
    I_trap_composite = h * (0.5*f(x_vals(1)) + sum(f(x_vals(2:end-1))) + 0.5*f(x_vals(end)));
    fprintf('(c) Composite Trapezoidal Rule (n=%d): %.6f\n', n, I_trap_composite);
end

% (d) Simpson's 1/3 Rule (n = 2)
n = 2;
x_vals = linspace(a, b, n+1);
h = (b - a) / n;
I_simp_13 = (h/3) * (f(x_vals(1)) + 4*f(x_vals(2)) + f(x_vals(3)));
fprintf('(d) Simpson''s 1/3 Rule: %.6f\n', I_simp_13);

% (e) Simpson's 3/8 Rule (n = 3)
n = 3;
x_vals = linspace(a, b, n+1);
h = (b - a) / n;
I_simp_38 = (3*h/8) * (f(x_vals(1)) + 3*f(x_vals(2)) + 3*f(x_vals(3)) + f(x_vals(4)));
fprintf('(e) Simpson''s 3/8 Rule: %.6f\n', I_simp_38);
