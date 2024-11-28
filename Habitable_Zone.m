% Constants
sigma = 5.67e-8; % Stefan-Boltzmann constant in W/(m^2*K^4)
pi = 3.1416;    % Mathematical constant pi

% Number of random samples
numSamples = 100;

% Generate random input values
L_star = 0.5e26 + rand(numSamples, 1) * 2e26; % Stellar luminosity in Watts
A = 0.2 + rand(numSamples, 1) * 0.4; % Planetary albedo
S = 0.5 + rand(numSamples, 1) * 0.5; % Stellar spectral type
G = randn(numSamples, 1) * 50; % Greenhouse effect parameter
R_ocean = 1000 + randn(numSamples, 1) * 200; % Depth of ocean in meters

% Calculate effective temperature
T_eff = calculate_effective_temperature(L_star, A, sigma, pi);

% Adjust for greenhouse effect
T_eff = T_eff + G;

% Adjust for stellar spectral type
T_eff = T_eff .* S;

% Calculate habitable zone boundaries
[R_inner, R_outer] = calculate_habitable_zone_boundaries(L_star, A, sigma, pi, T_eff);

% Calculate the probability of success for the zone being a Habitable Zone
successProbability = sum(R_inner < R_ocean & R_ocean < R_outer) / numSamples;
fprintf('Probability of success for the zone being a Habitable Zone: %.2f\n', successProbability);

% Plot the results
figure;
subplot(2, 2, 1);
scatter3(L_star, A, T_eff, 'o', 'MarkerFaceColor', 'b');
xlabel('Stellar Luminosity (Watts)');
ylabel('Planetary Albedo');
zlabel('Effective Temperature (K)');
title('Habitable Zone Parameters');

subplot(2, 2, 2);
plot(L_star, R_inner, 'b.', L_star, R_outer, 'r.');
xlabel('Stellar Luminosity (Watts)');
ylabel('Habitable Zone Radius (meters)');
legend('Inner Boundary', 'Outer Boundary');
title('Habitable Zone Boundaries');

subplot(2, 2, 3);
scatter3(A, S, T_eff, 'o', 'MarkerFaceColor', 'g');
xlabel('Planetary Albedo');
ylabel('Stellar Spectral Type');
zlabel('Effective Temperature (K)');
title('Habitable Zone Parameters');

subplot(2, 2, 4);
scatter3(R_ocean, R_inner, R_outer, 'o', 'MarkerFaceColor', 'm');
xlabel('Ocean Depth (meters)');
ylabel('Inner Boundary (meters)');
zlabel('Outer Boundary (meters)');
title('Habitable Zone Boundaries vs Ocean Depth');

function T_eff = calculate_effective_temperature(L_star, A, sigma, pi)
    T_eff = ((L_star .* (1 - A)) ./ (16 * sigma * pi)) .^ 0.25;
end

function [R_inner, R_outer] = calculate_habitable_zone_boundaries(L_star, A, sigma, pi, T_eff)
    R_inner = sqrt((L_star .* (1 - A)) ./ (1.1 * sigma * pi * T_eff.^4));
    R_outer = sqrt((L_star .* (1 - A)) ./ (0.53 * sigma * pi * T_eff.^4));
end
