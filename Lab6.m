% Define data points
x = [0 2 4 6 9 11 12 15 17 19]; 
y = [5 6 7 6 9 8 8 10 12 12]; 

% Linear Fit (y = mx + c)
linear_coeff = polyfit(x, y, 1); 
y_linear = polyval(linear_coeff, x); 

% Quadratic Fit (y = ax^2 + bx + c)
quad_coeff = polyfit(x, y, 2); 
y_quad = polyval(quad_coeff, x); 

% R² Calculation
total_variation = sum((y - mean(y)).^2);
error_linear = sum((y - y_linear).^2);
R2_linear = 1 - (error_linear / total_variation);
error_quad = sum((y - y_quad).^2);
R2_quad = 1 - (error_quad / total_variation);

% Plot data and fits
figure;
scatter(x, y, 'bo', 'filled'); hold on;
plot(x, y_linear, 'r-', 'LineWidth', 2);
plot(x, y_quad, 'g--', 'LineWidth', 2);
legend('Data', 'Linear Fit', 'Quadratic Fit');
xlabel('x'); ylabel('y'); title('Linear vs Quadratic Fit');
grid on;

% Display results
disp('Linear Fit Coefficients:'), disp(linear_coeff)
disp('Quadratic Fit Coefficients:'), disp(quad_coeff)
disp(['R² for Linear Fit: ', num2str(R2_linear)])
disp(['R² for Quadratic Fit: ', num2str(R2_quad)])
