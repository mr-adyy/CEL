clc; clear; close all;

%% Domain
x = linspace(-0.02, 0.02, 400);  % 40 mm

%% Parameters
T_amb = 300;
r0 = 0.005;
T_peaks = [2000, 2200, 2500];  % Different peak temperatures

figure;
hold on;

for T_peak = T_peaks
    % Gaussian temp
    T = T_amb + (T_peak - T_amb) * exp(-(x.^2) / r0^2);
    sigma = (1925 - 0.455 * (T - 1808)) * 1e-3;
    kappa = 1 ./ sigma;  % Inverse relation to surface tension
    
    plot(x*1000, kappa * 1000, 'LineWidth', 2, 'DisplayName', ['T_{peak} = ', num2str(T_peak), ' K']);
end

xlabel('Position [mm]');
ylabel('Curvature [1/m] × 10^3');
title('Curvature Profiles for Different Heat Inputs');
legend;
grid on;
