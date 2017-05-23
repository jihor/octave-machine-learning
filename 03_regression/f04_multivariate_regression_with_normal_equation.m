close all force;
clear;
clc;

disp("--- You are running 'f04_multivariate_regression_with_normal_equation' file now ---")

% ------------------------ Functions ------------------------

function J = cost(X, y, theta)
    J = (1 / (2*rows(X))) * (norm(X*theta - y) ^ 2 );
endfunction

function [theta] = normalEquation(X, y)
    theta = pinv(X'*X)*X'*y;
endfunction

% -----------------------------------------------------------


range = [1:0.5:60];

% Can also use meshgrid(), see https://stackoverflow.com/questions/7446946/how-to-generate-all-pairs-from-two-vectors-in-matlab-using-vectorised-code
x = [(ones(length(range), 1) * range)(:), (ones(length(range), 1) * range)'(:)];
x1 = x(:,1);
x2 = x(:,2);

y = (1.5 * log(x1) + log (rem(x1, 6) + 6)) + (1.5 * log(x2) + log (rem(x2, 6) + 6));     % some nice function :)
plot3(x1, x2, y, '.k', 'marker', '.', 'markersize', 8);
m = length(x);                                         % count of training examples

% Suppose we want to try approximating our function with two hypotheses:
X1 = [ones(m, 1), log(x1), log(x2)];       % 1) h_theta(x) = theta0 + theta1 * log(x1) + theta2 * log(x2)
X2 = [ones(m, 1), sqrt(x1), sqrt(x2)];     % 3) h_theta(x) = theta0 + theta1 * sqrt(x1)+ theta2 * sqrt(x2)
                                 % Normal equation doesn't care about values being normalized or not, so no normalization this time
                                 % We also don't need any initial guess, because there's no iteration involved

theta1 = normalEquation(X1, y);
theta2 = normalEquation(X2, y);

hold on;                         % don't erase existing plot

plot3(x1, x2, X1*theta1, '.r');
plot3(x1, x2, X2*theta2, '.b');
legend('Test data','\theta_0 + \theta_1 \cdot log(x_1) + \theta_2 \cdot log(x_2)','\theta_0 + \theta_1 \cdot sqrt(x_1) + \theta_2 \cdot sqrt(x_2)', 'location', 'southeast');

fprintf('Cost for theta0 + theta1 * log(x) = %f\n', [cost(X1, y, theta1)]);
fprintf('Cost for theta0 + theta1 * x = %f\n', [cost(X2, y, theta2)]);