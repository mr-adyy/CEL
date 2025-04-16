clc; clear; close all;

% Define system parameters
k1 = 10;  % N/m
k2 = 30;  % N/m
k3 = 30;  % N/m
k4 = 10;  % N/m
m1 = 1;   % kg
m2 = 1;   % kg
m3 = 1;   % kg

% Construct mass and stiffness matrices
M = diag([m1, m2, m3]); % Mass matrix

K = [k1 + k2, -k2,       0;
     -k2,     k2 + k3,  -k3;
      0,      -k3,      k3 + k4]; % Stiffness matrix

% Given displacement vector at a specific time
x = [0.05; 0.04; 0.03]; % m

% Solve for acceleration using matrix equation: a = -inv(M) * K * x
a = -M \ (K * x);

% Display results
disp('Accelerations of the masses (m/s^2):');
disp(a);

% Plot results
figure;
bar(a);
xlabel('Mass index'); ylabel('Acceleration (m/s^2)');
title('Acceleration of Each Mass');
xticklabels({'Mass 1', 'Mass 2', 'Mass 3'});
grid on;
