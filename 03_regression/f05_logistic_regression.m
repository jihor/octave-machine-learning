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
        % h_theta is now not X * theta as it was with linear regression, but sigmoid(X * theta)
        theta = theta - (alpha / m) * X' * ( sigmoid(X * theta) - y);
    endfor
    cost = costFunction(X, y, theta);
endfunction

% -----------------------------------------------------------

range = [1:60];

% Can also use meshgrid(), see https://stackoverflow.com/questions/7446946/how-to-generate-all-pairs-from-two-vectors-in-matlab-using-vectorised-code
x = [(ones(length(range), 1) * range)(:), (ones(length(range), 1) * range)'(:)];
x1 = x(:,1);
x2 = x(:,2);

y_numeric = -10 + 15 * log(x1/40) +  x1 + 2 * x2 + 15 * log(x2/40);
y = y_numeric > 0;

hold on;
axis([1, 60, 1, 60]);
plot(x1(find(y==1)), x2(find(y==1)), 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 4);
plot(x1(find(y==0)), x2(find(y==0)), 'k.', 'MarkerFaceColor', 'k', 'MarkerSize', 6);
m = length(x);                                         % count of training examples

% Try approximating using hypothesis h_theta(x) = theta0 + theta1 * x1 + theta2 * x2
X = [ones(m, 1), x1, x2];

theta_init = [0; 0; 1];

alpha = 0.03;
iteration_count = 10000;
decision_boundary_x_values = [0; 60];

% hand-written gradient descent
[theta1, cost1] = gradientDescentWithCostFunction(X, y, theta_init, alpha, iteration_count, @costSigmoid1);
theta1
cost1
decision_boundary_y_values = ( 0.5 - theta1(1) - decision_boundary_x_values * theta1(2) ) ./ theta1(3) ;
plot(decision_boundary_x_values, decision_boundary_y_values, '-r', 'linewidth', 2) ;

% fminunc converges to a working solution
[theta2, cost2] = fminunc(@(t)(costSigmoid2(X, y, t)), theta_init, optimset('GradObj', 'on', 'MaxIter', 100));
theta2
cost2
decision_boundary_y_values = ( 0.5 - theta2(1) - decision_boundary_x_values * theta2(2) ) ./ theta2(3) ;
plot(decision_boundary_x_values, decision_boundary_y_values, '-k') ;

% Same results even when no gradient is provided
[theta3, cost3] = fminunc(@(t)(costSigmoid1(X, y, t)), theta_init, optimset('MaxIter', 100));
theta3
cost3
decision_boundary_y_values = ( 0.5 - theta3(1) - decision_boundary_x_values * theta3(2) ) ./ theta3(3) ;
plot(decision_boundary_x_values, decision_boundary_y_values, '-m') ;
