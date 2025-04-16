% 2D Wave Equation using Finite Difference Method (FDM)

% Grid parameters
Nx = 50;             % Number of grid points in x
Ny = 50;             % Number of grid points in y
Lx = 1;              % Length of plate in x
Ly = 1;              % Length of plate in y
dx = Lx / (Nx - 1);
dy = Ly / (Ny - 1);

% Time parameters
c = 1;               % Wave speed
dt = 0.001;          % Time step
T = 1;               % Total simulation time
Nt = round(T / dt);  % Number of time steps

% CFL condition check
CFL = c * dt / dx;
if CFL > 1/sqrt(2)
    warning('CFL condition not satisfied. Reduce dt or increase dx.');
end

% Initialize u: displacement grids
u_now = zeros(Nx, Ny);      % At time n
u_old = zeros(Nx, Ny);      % At time n-1
u_new = zeros(Nx, Ny);      % At time n+1

% Initial condition: small Gaussian in the center
[X, Y] = meshgrid(linspace(0, Lx, Nx), linspace(0, Ly, Ny));
u_now = exp(-100 * ((X - 0.5).^2 + (Y - 0.5).^2));
u_old = u_now;  % Assume zero initial velocity

% Precompute constants
coeff_x = (c * dt / dx)^2;
coeff_y = (c * dt / dy)^2;

% Simulation loop
for n = 1:Nt
    for i = 2:Nx-1
        for j = 2:Ny-1
            u_new(i,j) = 2*u_now(i,j) - u_old(i,j) + ...
                coeff_x * (u_now(i+1,j) - 2*u_now(i,j) + u_now(i-1,j)) + ...
                coeff_y * (u_now(i,j+1) - 2*u_now(i,j) + u_now(i,j-1));
        end
    end

    % Boundary conditions (Dirichlet: fixed edges)
    u_new(1,:) = 0; u_new(Nx,:) = 0;
    u_new(:,1) = 0; u_new(:,Ny) = 0;

    % Visualization
    if mod(n,10) == 0
        surf(X, Y, u_new', 'EdgeColor', 'none');
        title(sprintf('2D Wave at time %.3f s', n*dt));
        xlabel('x'); ylabel('y'); zlabel('Displacement');
        axis([0 1 0 1 -1 1]);
        drawnow;
    end

    % Update time steps
    u_old = u_now;
    u_now = u_new;
end
