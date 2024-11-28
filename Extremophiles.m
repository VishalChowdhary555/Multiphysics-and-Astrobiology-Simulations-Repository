% Number of random inputs
num_inputs = 1000;

% Initialize variables to store success/failure counts
success_count = 0;
failure_count = 0;

% Loop through random inputs
for i = 1:num_inputs
    % Randomly generate environmental conditions
    temperature = randn() * 50 + 273;  % Random temperature in Kelvin
    pH = rand() * 14;  % Random pH value
    salinity = rand() * 3;  % Random salinity value
    
    % Define threshold values for extremophile existence
    temperature_threshold = 273;  % Minimum temperature for extremophiles to exist
    pH_threshold = 3;  % Minimum pH for extremophiles to exist
    salinity_threshold = 1;  % Maximum salinity for extremophiles to exist
    
    % Check for extremophile existence
    is_extremophile = (temperature >= temperature_threshold) && ...
                      (pH >= pH_threshold) && ...
                      (salinity <= salinity_threshold);
    
    % Update success/failure counts
    if is_extremophile
        success_count = success_count + 1;
    else
        failure_count = failure_count + 1;
    end
end

% Calculate the probability of success
probability_success = success_count / num_inputs;

% Display the results
fprintf('Number of successful extremophiles: %d\n', success_count);
fprintf('Number of unsuccessful extremophiles: %d\n', failure_count);
fprintf('Probability of success: %.2f%%\n', probability_success * 100);

% Plot the results
figure;
bar([success_count, failure_count], 'FaceColor', [0.2, 0.4, 0.6]);
xlabel('Extremophile Existence');
ylabel('Count');
title('Extremophile Existence Based on Random Inputs');
xticklabels({'Success', 'Failure'});
grid on;
