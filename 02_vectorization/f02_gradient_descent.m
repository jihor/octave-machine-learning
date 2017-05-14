disp("--- You are running 'f02_gradient_descent' file now ---")

A = [ones(5,1) [1;2;3;4;5]];
b = [1;2;3;4;5];
x = [0.1;0.9];

disp("\nLet's use linear regression to model a relatioship")
disp("between our samples and target values and")
disp("write a function using gradient descent to compute inv(A)*b,")
disp("which will be the optimal parameters for hypothesis\n")

function x = matrixInverseVector(A, b, x_init, alpha)
  x = x_init - alpha*2*A'*(A*x_init - b);
  i = 0;
  max_i = 10000;
  while (!isnan(norm(A*x - b) ^ 2) && norm(A*x - b) ^ 2 > 10 ^ - 4 && i < max_i)
     x = x - alpha*2*A'*(A*x - b);
     i += 1;
  endwhile
  if isnan(norm(A*x - b) ^ 2)
    disp(sprintf("Got NaN after %d iterations with alpha %d", i, alpha));
  elseif (isnan(norm(A*x - b) ^ 2) || norm(A*x - b) ^ 2 > 10 ^ - 4)
    disp(sprintf("Could not converge in %d iterations with alpha %d", i, alpha));
  else
    disp(sprintf("Converged in %d iterations with alpha = %d", i, alpha));
  endif
endfunction

matrixInverseVector(A, b, x, 0.00001)
matrixInverseVector(A, b, x, 0.00003)
matrixInverseVector(A, b, x, 0.0001)
matrixInverseVector(A, b, x, 0.0003)
matrixInverseVector(A, b, x, 0.001)
matrixInverseVector(A, b, x, 0.003)
matrixInverseVector(A, b, x, 0.01)
matrixInverseVector(A, b, x, 0.03)
matrixInverseVector(A, b, x, 0.1)
matrixInverseVector(A, b, x, 0.3)
matrixInverseVector(A, b, x, 1)

A \ b     % actually does the same and computes inv(A)*b far faster