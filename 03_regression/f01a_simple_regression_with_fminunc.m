close all force;
clear;
clc;

disp("--- You are running 'f01a_simple_regression_with_fminunc' file now ---")

% ------------------------ Functions ------------------------

function J = cost(X, y, theta)
    J = (1 / (2*rows(X))) * (norm(X*theta - y) ^ 2 );
endfunction

% -----------------------------------------------------------


x = [1:0.5:60]';
y = (1.5 * log(x) + log (rem(x, 2) + 2));              % some nice function :)
plot(x, y, '.k', 'marker', '.', 'markersize', 16);
m = length(x);                                         % count of training examples

                                 % Suppose we want to try approximating our function with three hypotheses:
X1 = [ones(m, 1), log(x)];       % 1) h_theta(x) = theta0 + theta1 * log(x)
X2 = [ones(m, 1), x];            % 2) h_theta(x) = theta0 + theta1 * x
X3 = [ones(m, 1), sqrt(x)];      % 3) h_theta(x) = theta0 + theta1 * sqrt(x)

theta_init = [0; 1];                  % Let's start with theta0 = 0 and theta1 = 1

% fminunc finds minimum of an unconstrained function
theta1 = fminunc(@(t)cost(X1, y, t), theta_init, optimset('MaxIter', 100));
theta2 = fminunc(@(t)cost(X2, y, t), theta_init, optimset('MaxIter', 100));
theta3 = fminunc(@(t)cost(X3, y, t), theta_init, optimset('MaxIter', 100));

hold on;                         % don't erase existing plot

plot(x, X1*theta1, '-r');
plot(x, X2*theta2, '-b');
plot(x, X3*theta3, '-m');
legend('Test data','\theta_0 + \theta_1 \cdot log(x)','\theta_0 + \theta_1 \cdot x','\theta_0 + \theta_1 \cdot sqrt(x)', 'location', 'southeast');

fprintf('Cost for theta0 + theta1 * log(x) = %f\n', [cost(X1, y, theta1)]);
fprintf('Cost for theta0 + theta1 * x = %f\n', [cost(X2, y, theta2)]);
fprintf('Cost for theta0 + theta1 * sqrt(x) = %f\n', [cost(X3, y, theta3)]);