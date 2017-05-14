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
length(A)              % 3 - length returns the largest dimension value
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

A = [1 2; 3 4; 5 6]
B = [10 20; 30 40; 50 60]
C = [1 2; 2 4]
[A B]      % concatenate adding columns, [A, B] does the same
[A; B]     % concatenate adding rows
A .* 5     % [  5  10;  15  20;  25  30]
A * 5      % [  5  10;  15  20;  25  30]
A .* B     % [ 10  40;  90 160; 250 360] - .* does element-wise multiplication. Matrices must have the same dimensions
A * C      % [  5  10;  11  22;  17  34] - * does the usual matrix multiplication, where MxN * NxL -> MxL

A'         % [1 3 5; 2 4 6 ] - transposition
flipud(A)  % [5 6; 3 4; 1 2] - flip the matrix

max(A)                       % [5 6]     - column-wise maximum
max(A,[],1)                  % [5 6]     - same, column-wise maximum
max(A,[],2)                  % [2; 4; 6] - row-wise maximum
max(A(:))                    % 6 - max of a vector is just one digit
max(max(A))                  % 6 - same
max([1 3; 5 7],[0 4; 3 9])   % [1 4; 5 9] - element-wise maximum for two matrices

min(A)                       % [1 2] - column-wise minimum
min([1 3; 5 7],[0 4; 3 9])   % [0 3; 3 7] - element-wise minimum for two matrices

A < 4      % [1 1; 1 0; 0 0] - element-wise comparison. Use find() to get the actual values
sum(A)     % [9 12]     - column-wise sum of all elements
sum(A, 1)  % [9 12 ]    - same, column-wise sum of all elements
sum(A, 2)  % [3; 7; 11] - row-wise sum of all elements
prod(A)    % [15 48] - column-wise product of all elements

A ./ 10    % [0.1 0.2; 0.3 0.4; 0.5 0.6]
A / 10     % [0.1 0.2; 0.3 0.4; 0.5 0.6]
10 ./ A    % [ 10 5.0; 3.3 2.5; 2.0 1.67]
A ./ B     % [0.1 0.1; 0.1 0.1; 0.1 0.1] - ./ does element-wise division. Matrices must have the same dimensions

% Matrix generation functions
disp("\nMatrix generation functions")
F = ones(3,2)          % 3x2 matrix of ones
G = zeros(3,2)         % 3x2 matrix of zeros. Note that it's 'zeros', not 'zeroes' like in NumPy
H = eye(3)             % 3x3 identity matrix

I = rand(3,2)          % 3x2 matrix of random-distributed values in [0..1] range
                       % (uniform distribution)

J = randn(3,2)         % 3x2 matrix of random-distributed values in [-..1] range
                       % (normal / gaussian distribution with mean value = 0 and variance = 1)

K = randn(3,2)         % 3x2 matrix of random-distributed values in [-..1] range
                       % (normal / gaussian distribution with mean value = 0 and variance = 1)

hist(randn(1,10000), 100)    % print histogam with 10 bins