% Number of random inputs
num_inputs = 1000;

% Initialize counter for successful instances
successful_instances = 0;

for i = 1:num_inputs
    % Randomly generate inputs
    ribonucleotide_concentration = 0.0001 + rand() * 0.001;
    temperature = randi([0, 100]);
    pH = 6 + rand() * 2;
    self_replication_rate = rand() * 0.2;

    % Check if RNA World conditions are met
    ribonucleotide_condition = ribonucleotide_concentration > 0.0005;
    temperature_condition = temperature > 0 && temperature < 100;
    pH_condition = pH > 6 && pH < 8;
    self_replication_condition = self_replication_rate > 0.05;

    rna_world_conditions = ribonucleotide_condition && temperature_condition && ...
                           pH_condition && self_replication_condition;

    % Count successful instances
    successful_instances = successful_instances + rna_world_conditions;
end

% Calculate the probability of success
probability_of_success = successful_instances / num_inputs;

% Display the results
fprintf('Number of successful instances: %d\n', successful_instances);
fprintf('Probability of success: %.2f%%\n', probability_of_success * 100);
