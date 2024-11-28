% Define parameters for an exoplanet's atmosphere
oxygen_concentration = 0.18 + 0.02 * randn();  % Randomized oxygen concentration
methane_concentration = 0.00008 + 0.00002 * randn();  % Randomized methane concentration
water_vapor_concentration = 0.01 + 0.002 * randn();  % Randomized water vapor concentration
carbon_dioxide_concentration = 0.01 + 0.002 * randn();  % Randomized carbon dioxide concentration
nitrogen_concentration = 0.78 + 0.02 * randn();  % Randomized nitrogen concentration

% Define thresholds for potential biosignatures
oxygen_threshold = 0.15;  % Adjusted oxygen concentration threshold
methane_threshold = 0.00005;  % Adjusted methane concentration threshold
redox_threshold = 0.5;  % Adjusted Redox ratio threshold

% Calculate the Redox ratio as an indicator of chemical disequilibria
redox_ratio = (oxygen_concentration / carbon_dioxide_concentration) / (0.21 / 0.01); 

% Check for potential biosignatures with adjusted thresholds
potential_biosignature = (oxygen_concentration > oxygen_threshold) && ...
                          (methane_concentration > methane_threshold) && ...
                          (redox_ratio > redox_threshold);

% Display the results
fprintf('Oxygen concentration: %.4f\n', oxygen_concentration);
fprintf('Methane concentration: %.6f\n', methane_concentration);
fprintf('Redox ratio: %.4f\n', redox_ratio);
fprintf('Potential biosignature detected: %d\n', potential_biosignature);

% Graphical representation (bar chart)
figure;
bar([oxygen_concentration, methane_concentration, water_vapor_concentration, ...
    carbon_dioxide_concentration, nitrogen_concentration], 'FaceColor', [0.2, 0.4, 0.6]);
xlabel('Atmospheric Gases');
ylabel('Concentration');
title('Atmospheric Composition of an Exoplanet');
xticklabels({'Oxygen', 'Methane', 'Water Vapor', 'CO2', 'Nitrogen'});
grid on;
