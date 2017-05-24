close all force;
clear;
clc;

disp("--- You are running 'f05_logistic_regression' file now ---")

% ------------------------ Functions ------------------------

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

function X_norm = featureNormalize(X)
    mu = mean(X);                     % we would've also needed to return mu and sigma if new values were to be predicted
    sigma = std(X);
    X_norm = (X - mu) ./ sigma;
endfunction

% -----------------------------------------------------------

range = [1:3:60];

% Can also use meshgrid(), see https://stackoverflow.com/questions/7446946/how-to-generate-all-pairs-from-two-vectors-in-matlab-using-vectorised-code
x = [(ones(length(range), 1) * range)(:), (ones(length(range), 1) * range)'(:)];
x1 = x(:,1);
x2 = x(:,2);

y = ((x1 - 30) .^ 2) + (((x2 - 30) .* 1.7) .^ 2) - 400 < 0;    % some nice function :)

hold on;
plot(x1(find(y==1)), x2(find(y==1)), 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 6);
plot(x1(find(y==0)), x2(find(y==0)), 'k.', 'MarkerFaceColor', 'k', 'MarkerSize', 8);
m = length(x);                                         % count of training examples



