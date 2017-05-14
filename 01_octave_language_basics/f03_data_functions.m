disp("--- You are running 'f03_data_functions' file now ---")

% It's simple to load data without headers
% 'load' function will separate rows by both comma and space
load data/03_data_functions/features_noheaders.csv    % strings starting with # are treated as comments and
                                                      % ignored both in header and body of the file.
                                                      % see function reference at https://octave.sourceforge.io/octave/function/load.html

features_noheaders                                    % default variable name is equal to loaded file name

% To read delimited data, other functions are available
features = dlmread('data/03_data_functions/features.csv')              % wrong - header was converted to 3 rows with zero values

features = importdata('data/03_data_functions/features.csv', ',', 1)
                     % that's what we need
                     % but be aware that dlmread and importdata don't skip comments like load function does
type features        % some scalar structure
features.data
length(features.data)
size(features.data)

target_values = importdata('data/03_data_functions/target_values.csv', ',', 1)
target_values.data

feature_1_6_range = features.data(1:6)
save data/tmp/features_1_6_range.dat feature_1_6_range    % save a range of the data
save('-binary', 'data/tmp/features.dat', 'features')      % save the whole structure, use binary format for compression