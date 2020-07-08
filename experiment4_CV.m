% Comprehensive Chemical Experiment 4

% Electrochemical synthesis of polyaniline, performance measurement, and application in measuring pH value

% Cyclic Voltammetry

% Please first Load your CV figure data.

plot(curve1.v, curve1.i, 'r-');

hold on;

plot(curve2.v, curve2.i, 'g-');

plot(curve3.v, curve3.i, 'b-');

plot(curve4.v, curve4.i, 'c-');

plot(curve5.v, curve5.i, 'm-');

plot(curve6.v, curve6.i, 'k-');

xlabel('$$ V / V $$', 'Interpreter', 'latex');
ylabel('$$ I / A $$', 'Interpreter', 'latex');
title('Cyclic Voltammetry');
legend({'5 mV / s', '10 mV / s', '15 mV / s', '20 mV / s', '25 mV / s', '30 mV / s'}, 'Location', 'northwest');
% If your MATLAB is not new enough to run this `legend` command with `'Location'`, please try the command in next line instead.
% legend({'5 mV / s', '10 mV / s', '15 mV / s', '20 mV / s', '25 mV / s', '30 mV / s'}, 2);

hold off;
