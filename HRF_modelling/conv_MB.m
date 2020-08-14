function c = conv_MB(a, b)
% it is same as conv function of MATLAB. It returns exactly the same length
% of a.

if ~isvector(a) || ~isvector(b)
  error(message('MATLAB:conv:AorBNotVector'));
end

if nargin < 3
    shape = 'full';
end

if ~ischar(shape)
  error(message('MATLAB:conv:unknownShapeParameter'));
end

% compute as if both inputs are column vectors
c = conv2(a(:),b(:),shape);

% restore orientation
if shape(1) == 'f' || shape(1) == 'F'  %  shape 'full'
    if length(a) > length(b)
        if size(a,1) == 1 %row vector
            c = c.';
        end
    else
        if size(b,1) == 1 %row vector
            c = c.';
        end
    end
else
    if size(a,1) == 1 %row vector
        c = c.';
    end
end
c=c(1:length(a));
    
    
    
