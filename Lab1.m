clc; clear; close all;

%% Given Data
T0 = 70;    % Initial temperature (°C)
Ta = 20;    % Ambient temperature (°C)
k = 0.19;   % Cooling constant (1/min)
dt = 2;     % Time step (min)
t_end = 20; % Final time (min)

%% Time Array
t = 0:dt:t_end; % Time steps
N = length(t);  % Number of steps

%% Euler's Method Implementation
T_euler = zeros(1, N);
T_euler(1) = T0; % Initial condition

for i = 1:N-1
    T_euler(i+1) = T_euler(i) - k * dt * (T_euler(i) - Ta);
end

%% Analytical Solution
T_analytical = Ta + (T0 - Ta) * exp(-k * t);

%% Plotting the Results
figure;
plot(t, T_euler, 'ro-', 'LineWidth', 2, 'DisplayName', 'Euler''s Method');
hold on;
plot(t, T_analytical, 'b--', 'LineWidth', 2, 'DisplayName', 'Analytical Solution');
xlabel('Time (min)');
ylabel('Temperature (°C)');
title('Newton''s Law of Cooling: Euler vs. Analytical');
legend;
grid on;

%% Display Results
disp('Time (min) | Euler Method (°C) | Analytical (°C)');
disp([t' T_euler' T_analytical']);
