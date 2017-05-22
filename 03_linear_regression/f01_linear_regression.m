close all force;
clear;
clc;

disp("--- You are running 'f01_linear_regression' file now ---")

x = [1:0.5:60]';
y = (1.5 * log(x) + log (rem(x, 2) + 2));              % some nice function :)
plot(x, y, '.k', 'marker', '.', 'markersize', 16);
m = length(x);                                         % count of training examples

                                 % Suppose we want to try approximating our function with three hypotheses:
X1 = [ones(m, 1), log(x)];       % 1) h_theta(x) = theta0 + theta1 * log(x)
X2 = [ones(m, 1), x];            % 2) h_theta(x) = theta0 + theta1 * x
X3 = [ones(m, 1), sqrt(x)];      % 3) h_theta(x) = theta0 + theta1 * sqrt(x)

function J = cost(X, y, theta)
    J = (1 / (2*rows(X))) * (norm(X*theta - y) ^ 2 );
endfunction

function [theta, J_history] = gradientDescent(X, y, theta, alpha, iteration_count)
    m = length(X);
    for i = 1:iteration_count
        theta = theta - (alpha / m) * X' * ( X * theta - y);
        J_history(i) = cost(X, y, theta);
    endfor
endfunction

theta = [0; 1];                  % Let's start with theta0 = 0 and theta1 = 0
iteration_count = 10000;
alpha = 0.001;                   % gradient descent step

[theta1, J_history1] = gradientDescent(X1, y, theta, 0.01,  1000);
[theta2, J_history2] = gradientDescent(X2, y, theta, 0.001, 50000);
[theta3, J_history3] = gradientDescent(X3, y, theta, 0.01,  1000);

hold on;                         % don't erase existing plot


fprintf('Cost for theta0 + theta1 * log(x) = %f\n', [cost(X1, y, theta1)]);
fprintf('Cost for theta0 + theta1 * x = %f\n', [cost(X2, y, theta2)]);
fprintf('Cost for theta0 + theta1 * sqrt(x) = %f\n', [cost(X3, y, theta3)]);

plot(x, X1*theta1, '-k');
plot(x, X2*theta2, '-r');
plot(x, X3*theta3, '-b');


