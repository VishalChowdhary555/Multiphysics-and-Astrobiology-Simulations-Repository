
% Parameters
num_simulations = 1000;

% Store success outcomes for each simulation
success_outcomes = zeros(1, num_simulations);

% Run multiple simulations
for simulation = 1:num_simulations
    success_outcomes(simulation) = Single_Simulation();
end

% Calculate and display the overall success probability
success_probability = sum(success_outcomes) / num_simulations;
fprintf('\nOverall Success Probability: %.2f\n', success_probability);

% Plot the success outcomes
Plot_Success_Outcomes(success_outcomes);


function success = Single_Simulation()

% Parameters for a single simulation
num_iterations = 100;
initial_template = 'AUGC'; % Initial RNA sequence
num_nucleotides = length(initial_template);
initial_concentration = 1e-6; % Initial concentration of RNA molecules
rate_constants = rand(num_nucleotides, 1) * 1e-3; % Random rate constants for each nucleotide
enzyme_concentration = 1e-9; % Concentration of catalytic enzyme
mutation_rate = 1e-4; % Probability of mutation per nucleotide

% Environmental conditions (hypothetical values)
temperature = randi([273, 373]); % Random temperature between 0 and 100 degrees Celsius
atmospheric_oxygen = rand(); % Random fraction of oxygen in the atmosphere

% Success criteria
success_threshold = 1e-3; % RNA concentration threshold for success

% Initialize RNA concentrations
RNA = zeros(num_nucleotides, num_iterations);
RNA(:, 1) = initial_concentration;

% Simulation
for iteration = 2:num_iterations
    % Replication: Complementary strand synthesis
    for i = 1:num_nucleotides
        % Incorporate environmental conditions into replication rate
        replication_rate = rate_constants(i) * enzyme_concentration * temperature_effect(temperature) * oxygen_effect(atmospheric_oxygen);
        RNA(i, iteration) = RNA(i, iteration - 1) + replication_rate * RNA(i, iteration - 1);
    end
    
    % Autocatalysis: Complementary strand becomes the new template
    template_concentration = sum(RNA(:, iteration));
    RNA(:, iteration) = RNA(:, iteration) + template_concentration;
    
    % Mutation: Introduce mutations probabilistically
    mutation_probabilities = rand(num_nucleotides, 1);
    mutation_indices = find(mutation_probabilities < mutation_rate);
    
    for i = mutation_indices
        RNA(i, iteration) = RNA(i, iteration) + 0.5 * RNA(i, iteration); % Simulated mutation (50% increase)
    end
    
    % Enzyme degradation: Enzyme concentration decreases over time
    enzyme_concentration = enzyme_concentration - 0.1 * enzyme_concentration;
    
    % Check success criteria
    if all(RNA(:, iteration) > success_threshold)
        success = 1; % Success
        return;
    end
end

success = 0; % No success

end

function effect = temperature_effect(T)
    % Hypothetical temperature effect function
    effect = exp(-(T - 300)^2 / (2 * 50^2));
end

function effect = oxygen_effect(oxygen_fraction)
    % Hypothetical oxygen effect function
    effect = oxygen_fraction;
end

function Plot_Success_Outcomes(success_outcomes)

% Plot the success outcomes
figure;
bar(success_outcomes);
xlabel('Simulation');
ylabel('Success (1) / Failure (0)');
title('Success Outcomes of RNA Replication Simulations');
ylim([-0.1 1.1]);
grid on;

end
