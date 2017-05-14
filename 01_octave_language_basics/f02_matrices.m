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
a1 = A(:)              % 1 3 5 2 4 6 - a vector created from this matrix (rows-first)
size(a1)               % 6x1
a2 = A(1:5)            % 1 3 5 2 4 - range, also rows-first, but an 1xM matrix, not Nx1 vector
size(a2)               % 1x5
a3 = A(:,2)            % 2 4 6 - select all rows, 2nd column
size(a3)               % 3x1
a4 = A(1:2,1)          % 1 3 - select rows [1..2], 1st column
size(a4)               % 2x1
a5 = A([1 3],:)        % 1 5 2 6 - select only rows 1 and 3, all columns
size(a5)               % 2x2
A(:,2) = [10; 11; 12]  % replace 2nd column with [10; 11; 12] vector
A(:,2) = [10 11 12]    % also works with a 1x3 matrix insead of vector
A = [A, [100; 101; 102]]  % add third row with [100; 101; 102] vector.
                          % this will throw a dimensions mismatch error if a [100 101 102] or [100, 101, 102] 1x3 matrix is passed

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