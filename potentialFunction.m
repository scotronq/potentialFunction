function [v,theta] = potentialFunction(m)
%potentialFunction calculates the potential function from m equidistant
%radial points
%
%   Input
%   m:      scalar or matrix, denoting the number of equal divisions and the
%           number of points for each division. First column is the number
%           of divisions, second column is the number of times for that
%           division
%
%   Output
%   v:      potential
%   theta:  radial positions
%
%   Example
%   m = [6 2;4 3];  % 6 equal points twice, 4 equal points 3 times
%   [v,theta] = potentialFunction(m);
%   v               % should equal -288
%
%   Scott Ronquist, scotronq@umich.edu. 1/23/19

%% Format m
if size(m,2) == 1
    m = [m,ones(size(m,1),1)];
elseif size(m,2) >= 3
    error('m is too large')
end

%% Generate thetas
theta = [];
for iM = 1:size(m,1)
    for iN = 1:m(iM,2)
        theta = [theta, [0:1/m(iM,1):1-1/m(iM,1)]*2*pi];     %changed to start at 0
    end
end
theta = sort(theta,'ascend');

%% Calculate potential function
v = 0;
for i = 1:length(theta)-1
    for j = i+1:length(theta)
        v = v + sin((theta(i)-theta(j))/2)^2;
    end
end
v = -2*v;

end

