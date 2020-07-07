% Comprehensive Chemical Experiment 6

% Research on properties of carbon nitride quantum dots mimic enzyme and measuring the content of GSH in serum

% Initialization

clear;
clc;

% Original Data

data = table;

data.V = [(0: 0.5: 2.0), 3.0]';
data.A = [0.052, 0.039, 0.032, 0.026, 0.022, 0.020]'; % Remember to replace the example with your own data!!!

% Curve Fit

% Model: y = a * exp(b * x + c) + d

% Initial Value Solution

data.logA = log(data.A);

p = polyfit(data.V, data.logA, 1);

% lsqcurvefit

xdata = data.V;
ydata = data.A;

fun = @(a, xdata) a(1) * exp(a(2) * xdata) + a(3);
a0 = [exp(p(2)), p(1), 0];
[A, resnorm] = lsqcurvefit(fun, a0, xdata, ydata);

% Sample

Ax = 0.043; % Remember to replace the example with your own data!!!

for Vx = 0: 0.00001: 0.5
    
    At = A(1) * exp(A(2) * Vx) + A(3);
    
    if At >= Ax - 0.0001 && At <= Ax + 0.0001
        
        break;
        
    end
    
end

plot(Vx, Ax, 'g*');

% Plot

curve = table;
curve.V = 0: 0.1: 3.0;
curve.A = A(1) * exp(A(2) * curve.V) + A(3);

plot(data.V, data.A, 'ro', curve.V, curve.A, 'b-', Vx, Ax, 'g*');
hold off;
xlabel('$$ {V}_{add}(GSH) / mL $$', 'Interpreter', 'latex');
ylabel('$$ A $$', 'Interpreter', 'latex');
title('$$ {V}_{add}(GSH) - A $$', 'Interpreter', 'latex');

% Output

fprintf('A = %.3f * exp(%.3f * v) - %.3f\n', A(1), A(2), A(3));
fprintf('The content of GSH in 1 mL serum sample is equal to the content in %.2f mL 0.010 mol * L ^ (-1) standard GSH sloution.\n', Vx);
