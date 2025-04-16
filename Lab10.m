clc; clear; close all;

% Define the differential equation dy/dt = y*t^2 - 1.1*y
f = @(t, y) y.*t.^2 - 1.1*y;

% Initial condition
t0 = 0;  % Initial time
y0 = 1;  % Initial value of y
t_end = 2;  % End time for visualization

% (a) Analytical Solution using dsolve
syms y(t)
ode = diff(y, t) == y*t^2 - 1.1*y;
cond = y(0) == 1;
y_analytical = dsolve(ode, cond);
fprintf('(a) Analytical Solution: %s\n', char(y_analytical));

% Convert solution to a function for plotting
y_analytical_func = matlabFunction(y_analytical);
t_analytical = linspace(t0, t_end, 100);
y_exact = y_analytical_func(t_analytical);

% (b) Euler’s Method with step sizes h = 0.5 and h = 0.25
h_values = [0.5, 0.25];
colors = ['r', 'b']; % Colors for different step sizes

figure; hold on;
plot(t_analytical, y_exact, 'k-', 'LineWidth', 2, 'DisplayName', 'Analytical Solution');

for j = 1:length(h_values)
    h = h_values(j);
    t_values = t0:h:t_end; % Generate time steps
    y_values = zeros(size(t_values));
    y_values(1) = y0; % Initial condition

    % Apply Euler’s Method
    for i = 1:length(t_values)-1
        y_values(i+1) = y_values(i) + h * f(t_values(i), y_values(i));
    end

    % Plot Euler’s results
    plot(t_values, y_values, strcat(colors(j), 'o-'), 'LineWidth', 1.5, ...
        'DisplayName', sprintf('Euler h=%.2f', h));
end

% Formatting the plot
xlabel('t'); ylabel('y');
title('Solution of dy/dt = y t^2 - 1.1 y using Euler''s Method');
legend;
grid on;
hold off;
