function o = sort(o) % --*-- Unitary tests --*--

% Sort method for dates class.
%
% INPUTS 
% - o [dates]
%
% OUTPUTS 
% - o [dates] with dates sorted by increasing order.

% Copyright (C) 2011-2015 Dynare Team
%
% This code is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare dates submodule is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.

if isequal(o.ndat(),1)
    return
end

o.time = sortrows(o.time,[1,2]);

%@test:1
%$ % Define some dates
%$ B1 = '1953Q4';
%$ B2 = '1950Q2';
%$ B3 = '1950Q1';
%$ B4 = '1945Q3';
%$
%$ % Define expected results.
%$ e.time = [1945 3; 1950 1; 1950 2; 1953 4];
%$ e.freq = 4;
%$
%$ % Call the tested routine.
%$ d = dates(B1,B2,B3,B4);
%$ d = d.sort;
%$ 
%$ % Check the results.
%$ t(1) = dassert(d.time,e.time);
%$ t(2) = dassert(d.freq,e.freq);
%$ t(3) = size(e.time,1) == d.ndat();
%$ T = all(t);
%@eof:1

%@test:1
%$ % Define some dates
%$ B1 = '1953Q4';
%$ B2 = '1950Q2';
%$ B3 = '1950Q1';
%$ B4 = '1945Q3';
%$
%$ % Define expected results.
%$ e.time = [1945 3; 1950 1; 1950 2; 1953 4];
%$ e.freq = 4;
%$
%$ % Call the tested routine.
%$ d = dates(B1,B2,B3,B4);
%$ d = d.sort();
%$
%$ % Check the results.
%$ t(1) = dassert(d.time,e.time);
%$ t(2) = dassert(d.freq,e.freq);
%$ t(3) = size(e.time,1) == d.ndat();
%$ T = all(t);
%@eof:1
