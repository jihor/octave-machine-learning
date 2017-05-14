disp("--- You are running 'f05_statements_and_loops' file now ---")

% Loops nad if / elseif
disp("\n'for' loop 1")

for i = 1:10                    % for-loop construct uses '=' , not 'in'
  printf("Number %d \n", i)     % indentation doesn't matter for language parser
end                             % also endfor, endif, endwhile, endfunction can be used for clarity

disp("\n'for' loop 2")
vals = 1:2:10;
for i = vals
  printf("Number %d \n", 2^i)
endfor                          % let's use endfor here for a change

disp("\n'while' loop 1")
i = 0;
while true
  i += 1;
  if rem(i, 4) == 0
    continue
  end
  if rem(i, 2) == 0
    printf("Number %d\n", i)
  end
  if (i>10)
    break
  end
end

disp("\n'while' loop 2")
i = 0;
while true
  i += 1;
  if i == 1
    printf("Number 1\n")
  elseif i == 2                 % be aware that 'else if' would've started a new 'if' construct, which is probably not what we want
    printf("Number 2\n")
  elseif i == 3
    printf("Number 3\n")
  else
    break
  endif                         % can use endif or end
endwhile                        % can use endwhile or end

% Functions
disp("\nCustom functions")

% Don't make function definition the first thing in a file unless this is a function file
% see https://www.gnu.org/software/octave/doc/v4.2.1/Script-Files.html
function retval = doubler(x)    % retval is the returned value, 'doubler' is the function name
  retval = x^2;
endfunction                     % can use endfunction or end

doubler(2)
disp("\n")

function [a b] = two()    % can
  a = 3;
  b = 7;
end

[x y] = two()
disp("\n")

% Octave searches current path for classes and functions automatically.
% addpath() can add any required directory to path if required.
% See https://www.gnu.org/software/octave/doc/v4.2.1/Manipulating-the-Load-Path.html
[x y] = SupplementalFunctions.sq_and_sqrt(5)
disp("\n")
[x y z] = SupplementalFunctions.cards()
disp("\n")
[a b c d] = supplemental_function_multiple_returns(5)

% Cost function example
disp("\nLet's write our very own cost function")

% X is the design matrix
% y is the target variable vector (also called class labels)
% theta is the vector of hypothesis function parameters
function j = cost_function(X, y, theta)
  m = size(X, 1);
  p = X * theta;
  j = (1 / 2 * m) * sum ((p - y) .^ 2);
endfunction

X = [ones(5,1) [1; 2; 3; 4; 5]]
y = [1; 2; 3; 4; 5]
cost_function(X, y, [0.1; 0.9])
cost_function(X, y, [-0.2; 1.1])
cost_function(X, y, [0; 1])

