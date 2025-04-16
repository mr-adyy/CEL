clc; clear; close all;

%% Parameters
L = 0.75;       % Rod length (m)
dx = 0.025;     % Spatial step (m)
dt = 0.00015;   % Time step (s)
k = 1;          % Thermal conductivity (W/m°C)
alpha = k;      % Thermal diffusivity
Nx = L/dx + 1;  % Number of spatial points
Nt = 500;       % Number of time steps

%% Stability Check
Fo = alpha * dt / dx^2;
if Fo > 0.5
    warning('Stability condition not met! Reduce dt or increase dx.');
end

%% Initial & Boundary Conditions
T = ones(Nx, Nt) * 100; % Initial temperature: 100°C
T(1, :) = 0;            % Left boundary: 0°C
T(end, :) = 0;          % Right boundary: 0°C

%% Explicit Finite Difference Method
for t = 1:Nt-1
    T(2:Nx-1, t+1) = T(2:Nx-1, t) + Fo * (T(3:Nx, t) - 2*T(2:Nx-1, t) + T(1:Nx-2, t));
end

%% Plot Results
x = linspace(0, L, Nx);
time_steps = [1, 10, 50, 100, Nt]; 

figure; hold on;
for t = time_steps
    plot(x, T(:, t), 'DisplayName', sprintf('t = %.4f s', t * dt));
end
xlabel('Position (m)');
ylabel('Temperature (°C)');
title('1D Heat Conduction - Explicit Finite Difference');
legend; grid on;
