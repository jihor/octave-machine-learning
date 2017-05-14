% One way to define multiple functions in one file is to use a bunch of static functions wrapped in a class

% Once the class is loaded and compiled, Octave doesn't check for source file change.
% In order to pick up changes, it's required to unload it first.

classdef SupplementalFunctions


  methods(Static)

    function [a b] = sq_and_sqrt(x)
      a = x ^ 2;
      b = x ^ 0.5;
    endfunction

    function [a b c] = cards()
      a = 3;
      b = 7;
      c = "Ace";
    endfunction

  endmethods

endclassdef