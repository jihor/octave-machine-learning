disp("--- You are running 'f01_cost_function' file now ---")    % this disp() line aso serves a practical purpose:
                                                                % it makes function not the first code line in the file,
                                                                % and Octave won't throw error because of
                                                                % treating this file as a function file

disp("\nLet's write some cost functions")
function cost = simple_cost(A, x, b)
    p = A * x;
    cost = sum((p - b) .^ 2);
endfunction

function cost = shrewd_cost(A, x, b)
    cost = norm(A*x - b) ^ 2;
    % (A*x - b) is a vector
    % See https://octave.sourceforge.io/octave/function/norm.html
endfunction

A = [ones(5,1) [1;2;3;4;5]];
b = [1;2;3;4;5];

x1 = [0;1];
x2 = [0.1;0.9];
x3 = [-0.2;1.1];

simple_cost(A,x1,b)
simple_cost(A,x2,b)
simple_cost(A,x3,b)

disp('')
shrewd_cost(A,x1,b)
shrewd_cost(A,x2,b)
shrewd_cost(A,x3,b)