function [theta] = generateEqDistPoints(m)
%generateEqDistPoints calculates the radial position of equidistant points
%   given the partition number
%
%   Input
%   m:      scalar or matrix, denoting the number of equal divisions
%           (column 1) and the number of points for each division
%           (column 2). First column is the number of divisions, second
%           column is the number of times for that division
%
%   Output
%   theta:  radial positions
%
%   Example
%
%   Version 1.0 (03/18/19)
%   Written by: Scott Ronquist
%   Contact: 	scotronq@umich.edu
%   Created: 	1/23/19
%   
%   Revision History:
%   v1.0 (03/18/19)
%   * generateEqDistPoints.m created

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

end

