function [points] = getRandomPoints(I, alpha)
% Generates random points in the image
% Input:
%   I:                      grayscale image
%   alpha:                  random points
% Output:
%   points:                    point locations
%
	% -----fill in your implementation here --------
     h=size(I,1);
     w=size(I,2);
     p1=int32(w*rand(alpha,1));
     p2=int32(h*rand(alpha,1));
     p=[p1 p2];
     x=p==0;
     p(x)=1;
     points=p;

    % ------------------------------------------

end

