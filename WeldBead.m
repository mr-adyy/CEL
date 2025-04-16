% Define constants
rho = 7170; % Density in kg/m^3
g = 9.81; % Gravity in m/s^2
theta_deg = [8, 12]; % Contact angles in degrees
theta_rad = deg2rad(theta_deg); % Convert to radians

% Define temperature range
T = linspace(1300, 2500, 100); % Temperature range in Kelvin

% Compute minimum surface tension using the adjusted formula
sigma_min = 1860 - 0.489 * (T - 1808); 

% Compute capillary length in meters
L_cap_min = sqrt(sigma_min ./ (rho * g)); 

% Convert capillary length to mm
L_cap_mm_min = L_cap_min * 1000; % Convert meters to mm

% Compute weld bead width for both angles in mm
width_8_min = 2 * L_cap_mm_min * tan(theta_rad(1)); % Width for 8 degrees
width_12_min = 2 * L_cap_mm_min * tan(theta_rad(2)); % Width for 12 degrees

% Plot results
figure;
plot(T, width_8_min, 'r-', 'LineWidth', 2); 
hold on;
plot(T, width_12_min, 'b--', 'LineWidth', 2);
xlabel('Temperature (K)');
ylabel('Weld Bead Width (mm)');
title('Weld Bead Width (Min Surface Tension Case)');
legend('\theta = 8^\circ', '\theta = 12^\circ');
grid on;
