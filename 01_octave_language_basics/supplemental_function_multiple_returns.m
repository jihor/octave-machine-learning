% Function file can contain only one function :{
% File name should start with the function name

% Once the function is loaded and compiled, Octave doesn't check for source file change.
% In order to pick up changes, it's required to unload it first

% This function can return variable number of output arguments,
% depending on how many arguments are on the callee side
% See https://www.gnu.org/software/octave/doc/interpreter/Variable_002dlength-Return-Lists.html
function varargout = supplemental_function_multiple_returns (x)
  for i = 1:nargout       % nargout is the requested number of output arguments
      varargout{i} = i * x;
    endfor
endfunction