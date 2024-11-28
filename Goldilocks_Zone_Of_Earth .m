% Constants
sigma = 5.67e-8;  % Stefan-Boltzmann constant in W/(m^2*K^4)
pi = 3.1416;      % Mathematical constant pi

% Stellar parameters (example for the Sun)
L_star = 3.846e26;  % Solar luminosity in watts
S = 1;              % Stellar spectral type factor (1 for Sun)

% Planetary parameters (example for Earth)
d = linspace(0.5, 2, 100);  % Distance from the star in AU (astronomical units)
albedo_ice = 0.8;  % Albedo for icy surfaces
albedo_land = 0.2;  % Albedo for land surfaces
greenhouse_factor = 30;  % Greenhouse effect factor

% Calculate effective temperature
T_eff = ((L_star) ./ (16 * sigma * pi * d.^2)).^(1/4) * S;

% Adjust for albedo variations
albedo = albedo_land + (albedo_ice - albedo_land) * rand(size(d));  % Random albedo for illustration
T_eff = T_eff .* (1 - 0.3 * albedo);  % Albedo effect on effective temperature

% Adjust for greenhouse effect
T_eff = T_eff + greenhouse_factor;

% Calculate habitable zone boundaries
R_inner = sqrt((L_star) ./ (1.1 * sigma * pi * T_eff.^4));
R_outer = sqrt((L_star) ./ (0.53 * sigma * pi * T_eff.^4));

% Plot results
figure;
plot(d, R_inner, 'r-', 'LineWidth', 2, 'DisplayName', 'Inner Boundary');
hold on;
plot(d, R_outer, 'b-', 'LineWidth', 2, 'DisplayName', 'Outer Boundary');
xlabel('Distance from Star (AU)');
ylabel('Habitable Zone Boundary (AU)');
title('Habitable Zone Boundaries with Climate Considerations');
legend('Location', 'Best');
grid on;
