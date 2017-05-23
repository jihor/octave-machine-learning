close all force;
clear;
clc;

disp("--- You are running 'f01_simple_regression' file now ---")

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


x = [1:0.5:60]';
y = (1.5 * log(x) + log (rem(x, 2) + 2));              % some nice function :)
plot(x, y, '.k', 'marker', '.', 'markersize', 16);
m = length(x);                                         % count of training examples

                                 % Suppose we want to try approximating our function with three hypotheses:
X1 = [ones(m, 1), log(x)];       % 1) h_theta(x) = theta0 + theta1 * log(x)
X2 = [ones(m, 1), x];            % 2) h_theta(x) = theta0 + theta1 * x
X3 = [ones(m, 1), sqrt(x)];      % 3) h_theta(x) = theta0 + theta1 * sqrt(x)

% Same 3 hypotheses, now with normalized values
X1_norm = [ones(m, 1), featureNormalize(log(x))];
X2_norm = [ones(m, 1), featureNormalize(x)];
X3_norm = [ones(m, 1), featureNormalize(sqrt(x))];

theta = [0; 1];                  % Let's start with theta0 = 0 and theta1 = 0

alpha1 = 0.01;
iteration_count1 = 1000;

alpha2 = 0.001;
iteration_count2 = 50000;

alpha3 = 0.01;
iteration_count3 = 1000;

[theta1, J_history1] = gradientDescent(X1, y, theta, alpha1, iteration_count1);
[theta2, J_history2] = gradientDescent(X2, y, theta, alpha2, iteration_count2);
[theta3, J_history3] = gradientDescent(X3, y, theta, alpha3, iteration_count3);
[theta1_norm, J_history1_norm] = gradientDescent(X1_norm, y, theta, alpha1, iteration_count1);
[theta2_norm, J_history2_norm] = gradientDescent(X2_norm, y, theta, alpha2, iteration_count2);
[theta3_norm, J_history3_norm] = gradientDescent(X3_norm, y, theta, alpha3, iteration_count3);

hold on;                         % don't erase existing plot

plot(x, X1*theta1, '-r');
plot(x, X2*theta2, '-b');
plot(x, X3*theta3, '-m');
plot(x, X1_norm*theta1_norm, '--r');
plot(x, X2_norm*theta2_norm, '--b');
plot(x, X3_norm*theta3_norm, '--m');
legend('Test data','\theta_0 + \theta_1 \cdot log(x)','\theta_0 + \theta_1 \cdot x','\theta_0 + \theta_1 \cdot sqrt(x)', '\theta_0 + \theta_1 \cdot log(x) (normalized)','\theta_0 + \theta_1 \cdot x (normalized)','\theta_0 + \theta_1 \cdot sqrt(x) (normalized)', 'location', 'southeast');

fprintf('Cost for theta0 + theta1 * log(x) = %f\n', [cost(X1, y, theta1)]);
fprintf('Cost for theta0 + theta1 * log(x) (normalized) = %f\n', [cost(X1_norm, y, theta1_norm)]);
fprintf('Cost for theta0 + theta1 * x = %f\n', [cost(X2, y, theta2)]);
fprintf('Cost for theta0 + theta1 * x (normalized) = %f \n' , [cost(X2_norm, y, theta2_norm)]);
fprintf('Cost for theta0 + theta1 * sqrt(x) = %f\n', [cost(X3, y, theta3)]);
fprintf('Cost for theta0 + theta1 * sqrt(x) (normalized) = %f\n', [cost(X3_norm, y, theta3_norm)]);


figure (2);       % open new window
hold on;

iters1000 = [1:1000];
title('Cost function dynamic (logarithmic) on 1000 iterations for \theta_0 + \theta_1 \cdot log(x)');
xlabel('N_{iter}');
ylabel('Cost');
semilogy(iters1000, J_history1(1:1000), '-r');
semilogy(iters1000, J_history1_norm(1:1000), '--r');
legend('\theta_0 + \theta_1 \cdot log(x)', '\theta_0 + \theta_1 \cdot log(x) (normalized)');


figure (3);       % open new window
hold on;

iters50000 = [1:50000];
title('Cost function dynamic (logarithmic) n 50000 iterations for \theta_0 + \theta_1 \cdot x');
xlabel('N_{iter}');
ylabel('Cost');
semilogy(iters50000, J_history2(1:50000), '-b');
semilogy(iters50000, J_history2_norm(1:50000), '--b');

legend('\theta_0 + \theta_1 \cdot x', '\theta_0 + \theta_1 \cdot x (normalized)');


figure (4);       % open new window
hold on;

title('Cost function dynamic (logarithmic) on 1000 iterations for \theta_0 + \theta_1 \cdot sqrt(x)');
xlabel('N_{iter}');
ylabel('Cost');
semilogy(iters1000, J_history3(1:1000), '-m');
semilogy(iters1000, J_history3_norm(1:1000), '--m');
legend('\theta_0 + \theta_1 \cdot sqrt(x)','\theta_0 + \theta_1 \cdot sqrt(x) (normalized)');
