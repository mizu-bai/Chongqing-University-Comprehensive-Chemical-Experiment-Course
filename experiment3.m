% Comprehensive Chemical Experiment 

% The application of electrochemical oscillating reaction in measuring chlorine content in solubility chlorides.

% Initialization

clear;
clc;

% Original Data

data = table;
data.c = 0.04 * (6: 10)' / 50;
data.t = [201.354, 209.465, 216.115, 225.741, 230.654]'; % Remember to replace the example with your own data!!!

% Fit

% log(t) = k(1) * c + k(2)

data.lt = log(data.t);

[p, S] = polyfit(data.c, data.lt, 1);

std = table;
std.c = data.c;

[std.lt, delta] = polyval(p, std.c, S);

% R Solution

meanValue = table;
meanValue.c = mean(data.c);
meanValue.lt = mean(data.lt(:));

Lxx = sum(data.c .^ 2) - length(data.c) * meanValue.c .^ 2; 
Lyy = sum(data.lt .^ 2) - length(data.lt) * meanValue.lt .^ 2;
Lxy = sum(data.c .* data.lt) - length(data.c) .* meanValue.c .* meanValue.lt;

Rsq = Lxy ^ 2 / (Lxx * Lyy);

% Test

tx = 226.178; % Remember to replace the example with your own data!!!
ltx = log(tx) ;
cx = (ltx - p(2)) / p(1);

% Plot

plotline = table;
plotline.c = (4: 1: 10)' * 1e-3;
plotline.lt = polyval(p, plotline.c);
plot(data.c, data.lt, 'ro', plotline.c, plotline.lt, 'b-', cx, ltx, 'g*');
xlabel('$$ c(KCl) / {{mol} \cdot {L} ^ {-1}} $$', 'Interpreter', 'latex');
ylabel('$$ \ln {{t}_{ind}} $$', 'Interpreter', 'latex');
title('$$ \ln {{t}}_{ind} - c $$', 'Interpreter', 'latex');

% Print

fprintf('ln t = %.2f * c + %.2f\n', p(1), p(2));
fprintf('R ^ 2 = %.2f\n', Rsq);
fprintf('cx = %.2f\n', cx);