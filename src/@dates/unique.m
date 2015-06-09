function o = unique(o) % --*-- Unitary tests --*--

% Overloads the unique function for dates objects.
%
% INPUTS 
% - o [dates]
%
% OUPUTS 
% - o [dates]
%
% REMARKS 
% 1. Only the last occurence of a date is kept.

% Copyright (C) 2013-2015 Dynare Team
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

if o.ndat()<=1
    return
end

if isoctave || matlab_ver_less_than('8.1.0')
    [tmp, id, jd] = unique(o.time,'rows');
else
    [tmp, id, jd] = unique(o.time,'rows','legacy');
end

o.time = o.time(sort(id),:);

%@test:1
%$ % Define some dates
%$ B1 = '1953Q4';
%$ B2 = '1950Q2';
%$ B3 = '1950q1';
%$ B4 = '1945Q3';
%$ B5 = '1950Q2'; 
%$
%$ % Define expected results.
%$ e.time = [1953 4; 1950 1; 1945 3; 1950 2];
%$ e.freq = 4;
%$
%$ % Call the tested routine.
%$ d = dates(B1,B2,B3,B4,B5);
%$ d = d.unique();
%$ 
%$ % Check the results.
%$ t(1) = dassert(d.time,e.time);
%$ t(2) = dassert(d.freq,e.freq);
%$ t(3) = size(e.time,1) == d.ndat();
%$ T = all(t);
%@eof:1
