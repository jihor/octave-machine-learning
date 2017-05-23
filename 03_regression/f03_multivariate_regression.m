close all force;
clear;
clc;

disp("--- You are running 'f03_multivariate_regression' file now ---")

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

% Same 2 hypotheses, now with normalized values
X1_norm = [ones(m, 1), featureNormalize(log(x1)), featureNormalize(log(x2))];
X2_norm = [ones(m, 1), featureNormalize(sqrt(x1)), featureNormalize(sqrt(x2))];

theta = [0; 1; 1];                  % Let's start with theta0 = 0, theta1 = 1 and theta2 = 1

alpha = 0.01;
iteration_count = 1000;

[theta1, J_history1] = gradientDescent(X1, y, theta, alpha, iteration_count);
[theta2, J_history2] = gradientDescent(X2, y, theta, alpha, iteration_count);
[theta1_norm, J_history1_norm] = gradientDescent(X1_norm, y, theta, alpha, iteration_count);
[theta2_norm, J_history2_norm] = gradientDescent(X2_norm, y, theta, alpha, iteration_count);

hold on;                         % don't erase existing plot

plot3(x1, x2, X1*theta1, '.r');
plot3(x1, x2, X2*theta2, '.b');
plot3(x1, x2, X1_norm*theta1_norm, '.y');
plot3(x1, x2, X2_norm*theta2_norm, '.m');
legend('Test data','\theta_0 + \theta_1 \cdot log(x_1) + \theta_2 \cdot log(x_2)','\theta_0 + \theta_1 \cdot sqrt(x_1) + \theta_2 \cdot sqrt(x_2)', '\theta_0 + \theta_1 \cdot log(x_1) + \theta_2 \cdot log(x_2) (normalized)','\theta_0 + \theta_1 \cdot sqrt(x_1) + \theta_2 \cdot sqrt(x_2) (normalized)', 'location', 'southeast');

fprintf('Cost for theta0 + theta1 * log(x) = %f\n', [cost(X1, y, theta1)]);
fprintf('Cost for theta0 + theta1 * log(x) (normalized) = %f\n', [cost(X1_norm, y, theta1_norm)]);
fprintf('Cost for theta0 + theta1 * x = %f\n', [cost(X2, y, theta2)]);
fprintf('Cost for theta0 + theta1 * x (normalized) = %f \n' , [cost(X2_norm, y, theta2_norm)]);

figure (2);       % open new window
hold on;

iters1000 = [1:1000];
title('Cost function dynamic (logarithmic) on 1000 iterations for \theta_0 + \theta_1 \cdot log(x_1) + \theta_2 \cdot log(x_2)');
xlabel('N_{iter}');
ylabel('Cost');
semilogy(iters1000, J_history1(1:1000), '-r');
semilogy(iters1000, J_history1_norm(1:1000), '--r');
legend('\theta_0 + \theta_1 \cdot log(x_1) + \theta_2 \cdot log(x_2)', '\theta_0 ++ \theta_1 \cdot log(x_1) + \theta_2 \cdot log(x_2) (normalized)');

figure (3);       % open new window
hold on;

title('Cost function dynamic (logarithmic) on 1000 iterations for \theta_0 + \theta_1 \cdot sqrt(x_1) + \theta_2 \cdot sqrt(x_2)');
xlabel('N_{iter}');
ylabel('Cost');
semilogy(iters1000, J_history2(1:1000), '-m');
semilogy(iters1000, J_history2_norm(1:1000), '--m');
legend('\theta_0 + \theta_1 \cdot sqrt(x_1) + \theta_2 \cdot sqrt(x_2)','\theta_0 + \theta_1 \cdot sqrt(x_1) + \theta_2 \cdot sqrt(x_2) (normalized)');


