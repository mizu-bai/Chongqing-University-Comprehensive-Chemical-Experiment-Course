% Comprehensive Chemical Experiment 4

% Electrochemical synthesis of polyaniline, performance measurement, and application in measuring pH value

% Randles-Sevcik Euqation

% Initialization

clear;
clc;

% Original Data

data = table;
data.v = (5: 5: 30) * 1e-03;
data.sqrtv = sqrt(data.v);
data.ip = [0.00004727, 0.00008053, 0.0001164, 0.0001315, 0.0001617, 0.0001876]; % Remember to replace the example with your own data!!!

% Fit

% ip = p(1) * v ^ (1 / 2) + p(2)

p = polyfit(data.sqrtv, data.ip, 1);

% Plot

plotline = table;
plotline.sqrtv = 0.06: 0.02: 0.18;
plotline.ip = polyval(p, plotline.sqrtv);

plot(data.sqrtv, data.ip, 'ro', plotline.sqrtv, plotline.ip, 'b-');

xlabel('$$ \sqrt{v} / ({V} ^ \frac{1}{2} {\cdot} {s} ^ {- \frac{1}{2}}) $$', 'Interpreter', 'latex');
ylabel('$$ i_{p} / A $$', 'Interpreter', 'latex');
title('$$ i_{p} - \sqrt{v} $$', 'Interpreter', 'latex');

hold off;

% Output

fprintf('ip = %f * v ^ (1 / 2) + %f\n', p(1), p(2));
