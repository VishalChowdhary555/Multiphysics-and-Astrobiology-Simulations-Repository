% Constants
numSimulations = 1000;  % Number of simulations

% Sensible ranges for Drake Equation parameters
R_star_range = linspace(1, 20, numSimulations);  % Average rate of star formation (stars/year)
f_p_range = rand(1, numSimulations);  % Fraction of stars with planets
n_e_range = randi([1, 5], 1, numSimulations);  % Average number of planets that could support life per star with planets
f_l_range = rand(1, numSimulations);  % Fraction of planets where life actually develops
f_i_range = rand(1, numSimulations);  % Fraction of planets with intelligent life
f_c_range = rand(1, numSimulations);  % Fraction of planets with intelligent life that develop technology for communication
L_range = randi([1000, 10000], 1, numSimulations);  % Average length of time civilizations can communicate (years)

% Drake Equation
N_range = R_star_range .* f_p_range .* n_e_range .* f_l_range .* f_i_range .* f_c_range .* L_range;

% Plot outputs
figure;
scatter3(R_star_range, f_p_range, N_range, 'filled');
xlabel('R* (Stars/Year)');
ylabel('f_p (Fraction with Planets)');
zlabel('N (Number of Communicative Civilizations)');
title('Drake Equation Model');
grid on;

% Calculate probability of success
successCount = sum(N_range > 0);
totalSimulations = numel(N_range);
probabilityOfSuccess = successCount / totalSimulations;

fprintf('Probability of success: %.2f%%\n', probabilityOfSuccess * 100);
