% Comprehensive Chemical Experiment 2

% Synthesis of CCMC and research on the adsorption capacity for Methylene blue

% Initialization

clear; 
clc;

% Standard Curve Data

data = table;
data.c = [2, 4, 8, 12, 16]';
data.A = [0.395, 0.751, 1.388, 1.959, 2.473]'; % Remember to replace the example with your own data!!!

% Adsorption Test Data

test = table;
test.t = [20, 40, 60, 80, 90, 100]';
test.c = zeros(6, 1);
test.A = [0.219, 0.218, 0.208, 0.209, 0.229, 0.204]'; % Remember to replace the example with your own data!!!

% Concentration-Absorbance Fit

p = polyfit(data.c, data.A, 1);

fitline = table;
fitline.c = (0: 2: 18)';
fitline.A = polyval(p, fitline.c);

% Analysis on Absorption Test

for index = 1: length(test.t)
    
    test.c(index) = (test.A(index) - p(2)) / p(1);
    
end

% Time-Concentration Fit

% Excluding the Outliers

selectedData = table;

% Outliers test.t(5) & test.c(5) is excluded.

% [0, 200] is the initial value of time and concentration of MB when the test did not start. 

% Remember to select the data those will be used in lsqcurvefit by yourself!!!

selectedData.t = [0; test.t(1: 4); test.t(6)];
selectedData.c = [200; test.c(1: 4); test.c(6)];

% y = a * exp(b * x + c) + d
% a > 0, b < 0, c > 0, d > 0
% log(y - d) = b * x + c + log(a)

plot(test.t, test.c, 'g*');

% Initial Value Solution

xdata = selectedData.t;
ydata = selectedData.c;
logydata = log(ydata);
plot(xdata, logydata, 'ro');
q = polyfit(xdata, logydata, 1);

% lsqcurvefit

fun = @(a, xdata) a(1) * exp(a(2) * xdata + a(3)) + a(4);
a0 = [exp(q(2)), q(1), 0, 0];
[A, resnorm] = lsqcurvefit(fun, a0, xdata, ydata);

ads = table;
ads.t = (0: 10: 120)';
ads.c = A(1) * exp(A(2) * ads.t + A(3)) + A(4);
ads.r = A(1) * A(2) * exp(A(2) * ads.t + A(3));

% Plot

figure(1);
plot(data.c, data.A, 'ro', fitline.c, fitline.A, 'b-');
xlabel('$$ c(MB) / {mg} \cdot {L} ^ {-1} $$', 'Interpreter', 'latex');
ylabel('$$ A $$', 'Interpreter', 'latex');
title('Standard Curve');
hold off;

figure(2);
semilogy([0; test.t], [200; test.c], 'g*', ads.t, ads.c, 'r--');
xlabel('$$ t / min $$', 'Interpreter', 'latex');
ylabel('$$ c(MB) / {mg} \cdot {L} ^ {-1} $$', 'Interpreter', 'latex');
title('Adsorption Test Curve');
hold off;

figure(3);
plot(ads.t, ads.r, 'b-');
xlabel('$$ t / min $$', 'Interpreter', 'latex');
ylabel('$$ \frac{\mathrm{d} c}{\mathrm{d} t} / ({{mg} \cdot {L} ^ {-1} \cdot {min} ^ {-1}}) $$', 'Interpreter', 'latex');
title('Concentration Reduction Rate Curve');

% Output

fprintf('When meets saturated adsorption, the concentration of left MB is %.3f mg/L.\n', A(end));