% Comprehensive Chemical Experiment 4

% Electrochemical synthesis of polyaniline, performance measurement, and application in measuring pH value

% Initialization

clear;
clc;

% Original Data

data = table;
data.pH = [2, 4, 5, 6.9, 9]'; % Remember to replace the example with your own data!!!
data.E = [0.2503, 0.1910, 0.1395, 0.0208, -0.1350]'; % Remember to replace the example with your own data!!!

% Fit

% E = p(1) * pH + p(2)

[p, S] = polyfit(data.pH, data.E, 1);

std = table;
std.pH = data.pH;
[std.E, delta] = polyval(p, std.pH, S);

% R Solution

meanValue = table;
meanValue.pH = mean(data.pH);
meanValue.E = mean(data.E);

Lxx = sum(data.pH .^ 2) - length(data.pH) * meanValue.pH .^ 2; 
Lyy = sum(data.E .^ 2) - length(data.E) * meanValue.E .^ 2;
Lxy = sum(data.pH .* data.E) - length(data.pH) * meanValue.pH .* meanValue.E;

Rsq = Lxy ^ 2 / (Lxx * Lyy);

% Test

Ex = 0.1533; % Remember to replace the example with your own data!!!
pHx = (Ex - p(2)) / p(1);

% Plot

plotline = table;
plotline.pH = 0: 14;
plotline.E = polyval(p, plotline.pH);

xlabel('$$ pH $$', 'Interpreter', 'latex');
ylabel('$$ E / V $$', 'Interpreter', 'latex');
title('$$ E - pH $$', 'Interpreter', 'latex');

% Output

fprintf('E = %.2f * pH + %.2f\n', p(1), p(2));
fprintf('R ^ 2 = %.2f\n', Rsq);
fprintf('pH = %.2f\n', pHx);
