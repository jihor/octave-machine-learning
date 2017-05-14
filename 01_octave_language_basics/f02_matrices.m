disp("--- You are running 'f02_matrices' file now ---")

% Defining matrices
disp("\nDefining matrices")
A = [1 2; 3 4; 5 6]    % 3x2 matrix

B = [1 2;
3 4;
5 6]                   % same

C = [1; 2; 3]          % vector

D = 1:0.1:2            % vector containing [1..2] range with step of 0.1

E = 1:6                % vector containing [1..6] range with step of 1

size(A)                % 3x2. The result itself is a 1 x 2 matrix
size(A, 1)             % 3
size(A, 2)             % 2
A(1:6)                 % 1 3 5 2 4 6
length(A)              % 3 - length returns the largest dimension value

% Matrix generation functions
disp("\nMatrix generation functions")
F = ones(3,2)          % 3x2 matrix of ones
G = zeros(3,2)         % 3x2 matrix of zeros. Note that it's 'zeros', not 'zeroes' like in NumPy
H = eye(3,3)           % 3x3 identity matrix

I = rand(3,2)          % 3x2 matrix of random-distributed values in [0..1] range
                       % (uniform distribution)

J = randn(3,2)         % 3x2 matrix of random-distributed values in [-..1] range
                       % (normal / gaussian distribution with mean value = 0 and variance = 1)

K = randn(3,2)         % 3x2 matrix of random-distributed values in [-..1] range
                       % (normal / gaussian distribution with mean value = 0 and variance = 1)

hist(randn(1,10000), 100)    % print histogam with 10 bins