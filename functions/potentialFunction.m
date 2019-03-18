function [v] = potentialFunction(theta)
%potentialFunction calculates the cumulative potential given radial
%   positions
%
%   Input
%   theta:  radial positions
%
%   Output
%   v:      potential
%
%   Example
%   m = [6 2;4 3];  % 6 equal points twice, 4 equal points 3 times
%   [v,theta] = potentialFunction(m);
%   v               % should equal -288
%
%   Version 1.1 (03/18/19)
%   Written by: Scott Ronquist
%   Contact: 	scotronq@umich.edu
%   Created: 	1/23/19
%   
%   Revision History:
%   v1.0 (1/23/19)
%   * potentialFunction.m created
%   v1.1 (3/18/19)
%   * updated and formatted for git upload
%   * updated to just perform potential function aspect

%% Calculate potential function
v = 0;
for i = 1:length(theta)-1
    for j = i+1:length(theta)
        v = v + sin((theta(i)-theta(j))/2)^2;
    end
end
v = -2*v;

end

