% Define Mass Matrix M
M = [12000 0 0;
     0 10000 0;
     0 0 8000];

% Define Stiffness Matrix K (values in N/m)
K = [5.4e6  -2.4e6   0;
    -2.4e6   4.2e6  -1.8e6;
     0      -1.8e6   1.8e6];

% Solve the eigenvalue problem (Generalized eigenvalue problem: KΦ = λMΦ)
[eigenvectors, eigenvalues] = eig(K, M);

% Extract eigenvalues (natural frequencies squared)
lambda_vals = diag(eigenvalues);
omega_vals = sqrt(lambda_vals); % Natural frequencies in rad/s

% Normalize eigenvectors (set third floor displacement to 1)
for i = 1:3
    eigenvectors(:, i) = eigenvectors(:, i) / eigenvectors(3, i);
end

% Plot mode shapes
figure;
hold on;
grid on;
colors = ['r', 'g', 'b']; % Colors for different modes
for i = 1:3
    plot(eigenvectors(:, i), [1, 2, 3], '-o', 'Color', colors(i), ...
        'LineWidth', 2, 'MarkerSize', 8, 'DisplayName', sprintf('Mode %d', i));
end
set(gca, 'YDir', 'reverse'); % Invert y-axis (floor 1 at bottom)
xlabel('Normalized Amplitude');
ylabel('Floor Level');
title('Mode Shapes of the Three-Story Building');
legend show;
hold off;

% Display results
disp('Eigenvalues (lambda):');
disp(lambda_vals);

disp('Natural Frequencies (rad/s):');
disp(omega_vals);
