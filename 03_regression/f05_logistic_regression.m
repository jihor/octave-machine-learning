close all force;
clear;
clc;

disp("--- You are running 'f05_logistic_regression' file now ---")

% ------------------------ Functions ------------------------

% Sigmoid cost function
function J = costSigmoid1(X, y, theta)
    m = length(y);
    h = sigmoid(X * theta);
    J = (-1 / m) * (sum(log(h)(find(y == 1))) + sum(log(1 - h)(find(y == 0))));
endfunction

% Sigmoid cost function which also returns gradient
function [J, grad] = costSigmoid2(X, y, theta)
    m = length(y);
    h = sigmoid(X * theta);
    J = costSigmoid1(X, y, theta);
    grad = (1 / m) * X' * (h - y);
endfunction

function s = sigmoid(z)
    s = (1 ./ (1 + e .^ (-1 * z)));
endfunction

function [theta, cost] = gradientDescentWithCostFunction(X, y, theta, alpha, iteration_count, costFunction)
    m = length(X);
    for i = 1:iteration_count
        theta = theta - (alpha / m) * X' * ( X * theta - y);
    endfor
    cost = costFunction(X, y, theta);
endfunction

% -----------------------------------------------------------

range = [1:3:60];

% Can also use meshgrid(), see https://stackoverflow.com/questions/7446946/how-to-generate-all-pairs-from-two-vectors-in-matlab-using-vectorised-code
x = [(ones(length(range), 1) * range)(:), (ones(length(range), 1) * range)'(:)];
x1 = x(:,1);
x2 = x(:,2);

y_numeric = -100 + x1 + 2 * x2;
y = y_numeric > 0;

hold on;
axis([1, 60, 1, 60]);
plot(x1(find(y==1)), x2(find(y==1)), 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 6);
plot(x1(find(y==0)), x2(find(y==0)), 'k.', 'MarkerFaceColor', 'k', 'MarkerSize', 8);
m = length(x);                                         % count of training examples

% Try approximating using hypothesis h_theta(x) = theta0 + theta1 * x1 + theta2 * x2
X = [ones(m, 1), x1, x2];

theta_init = [-80; 1; 1];     % A pretty close initial guess. Without good guess, even fminunc doesn't converge.

alpha = 0.01;
iteration_count = 1000;

% simple gradient descnent yields NaN's, because sigmoid is not a bowl-shaped function
[theta1, cost1] = gradientDescentWithCostFunction(X, y, theta_init, alpha, iteration_count, @costSigmoid1);
theta1
cost1

% fminunc converges to a working solution
[theta2, cost2] = fminunc(@(t)(costSigmoid2(X, y, t)), theta_init, optimset('GradObj', 'on', 'MaxIter', 100));
theta2
cost2
decision_boundary_x_values = [0; 60];
decision_boundary_y_values = ( 0.5 - theta2(1) - decision_boundary_x_values * theta2(2) ) ./ theta2(3) ;
plot(decision_boundary_x_values, decision_boundary_y_values) ;

% Same results even when no gradient is provided
[theta3, cost3] = fminunc(@(t)(costSigmoid1(X, y, t)), theta_init, optimset('MaxIter', 100));
theta3
cost3
