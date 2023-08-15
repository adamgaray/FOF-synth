function A = FormantArray(varargin)

A = [];

maxlen = length(varargin{1});
for i = 1:nargin
    if length(varargin{i}) > maxlen
        maxlen = length(varargin{i});
    end
end

for i = 1:nargin
    A = [A; varargin{i} zeros(1, maxlen-length(varargin{i}))];
end