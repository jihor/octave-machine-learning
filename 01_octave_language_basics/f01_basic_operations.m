% this is a comment

% Files are named with prefix 'f' because Octave cannot run files starting with a digit.
% Run Octave CLI, cd into this directory (Octave has Linux-like cd / pwd / ls commands),
% then type name of this file (without .m extension) in the CLI and push Enter

% Printing output
disp("--- You are running 'f01_basic_operations' file now, congratulations ---")
dummy = 1    % output of this string will be printed like 'dummy = 1'
dummy = 2;   % ';' suppresses output - output of this string will not be printed

% Assignments
disp("\nAssignments")    % strings in double quotes are evaluated, strings in single quotes are not
                         % The newline symbol at the start of the string would be simply printed as '\n' instead of
                         % creating a new line, if this string was in single quotes
a = 7     % this is an inline comment

% Basic operations
disp("\nBasic operations")
b = a + 1
c = a - 1
d = a * 2
e = a / 2
f = a ^ 2

% Equality comparisons
disp("\nEquality comparisons. True is printed out as 1, false as 0")
1 == 1
1 ~= 1     % 'not equal' is written as ~=, not the common !=

% Logical operators
disp("\nLogical operators. True is printed out as 1, false as 0")
1 && 0
1 || 0

% Prompt string
disp("\nLet's change Octave prompt to 'oct://>'")
PS1('oct://>')    % change Octave prompt to 'oct://>'.
                  % PS1(), PS2(), PS4() are prompt string change instruction.
                  % See https://www.gnu.org/software/octave/doc/interpreter/Customizing-the-Prompt.html

% Displaying data
disp("\nDisplaying data")
g = pi
disp(sprintf('Rounded to 5 decimals Pi is %0.2f', g))

% Changing numeric display format
disp("\n Let's change numeric display format")
g    % 3.1416 (default format is short)
format long
g    % 3.14159265358979
format short
g    % 3.1416

% Help
disp("\nUsing help")
help disp    % print help for disp() command

% Variables
disp("\nManaging variables in scope")
who          % display all variables
whos         % display all variables with detailed infot
type c       % display type and value of variable c
exist c      % check if variable c exists -> true (1)
clear a b c  % expunge variable a, b and c
exist c      % check if variable c exists -> false (0)
clear -a     % expunge all variables
             % For complete docs, see https://www.gnu.org/software/octave/doc/interpreter/Status-of-Variables.html

% Sources
disp("\nListing Octave-specific files")
what         % See https://www.gnu.org/software/octave/doc/interpreter/Status-of-Variables.html