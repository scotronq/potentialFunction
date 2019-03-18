% Goal: find pattern in potential function with equidistant radial points
% 
%
%   Version 1.1 (03/18/19)
%   Written by: Scott Ronquist
%   Contact: 	scotronq@umich.edu
%   Created: 	1/23/19
%   
%   Revision History:
%   v1.0 (1/23/19)
%   * potentialFunctionTest.m created
%   v1.1 (3/18/19)
%   * updated and formatted for git upload
%   * include option to specify specific theta

%% set-up
clear
close all

addpath(genpath('.'))

%% potential function test parameters
%%% USER INPUT PARAMETERS %%%%%%%%%%%%%%%%
% column 1: number of equidistant points
% column 2: number of times to apply column 1
m = [6 2;4 3];                  % 6 equal points twice, 4 equal points 3 times

plotCircleFlag = 1;             % 1=plot, 0=no plot
extraTheta = [0, pi/4];         % input additional radial points
varTheta = [0 pi/4];            % vary theta between these radial values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% potential function calculation
% get radial position of points
theta = generateEqDistPoints(m);

% add extra Thetas
theta = sort([theta,extraTheta],'ascend');

% calculate potential function and output to command window
v = potentialFunction(theta);
fprintf('potential: %.2f\n',v)

%% figure - plot theta on unit circle
if plotCircleFlag
    if ~isempty(varTheta)
        figure('units','normalized','position',[.1 .1 .8 .8])
        subplot(1,2,1)
    else
        figure('units','normalized','position',[.1 .1 .5 .5])
    end
    
    circle(0,0,1), hold on, box on, axis equal
    plot([0 0], [-2 2], 'k-')
    plot([-2 2], [0 0], 'k-')
    
    % get theta groups
    G = findgroups(theta);
    
    maxCount = 0;
    for iG = 1:max(G)
        
        % get groups of overlapping points
        thetaG = theta(G == iG);
        thetaCount = 0;
        extraThetaCount = 0;
        for iTheta = 1:length(thetaG)
            
            numExtraTheta = sum(ismember(extraTheta,thetaG(iTheta)));
            % plot points on circle, extra thetas have different color
            if ismember(thetaG(iTheta),extraTheta) && extraThetaCount < numExtraTheta
                plot(cos(thetaG(iTheta))*(1+thetaCount*.1),...
                    sin(thetaG(iTheta))*(1+thetaCount*.1),'mo')
                extraThetaCount = extraThetaCount + 1;
            else
                plot(cos(thetaG(iTheta))*(1+thetaCount*.1),...
                    sin(thetaG(iTheta))*(1+thetaCount*.1),'ro')
            end
            
            % add text for position
            if iTheta == length(thetaG)
                thetaCount = thetaCount + 1;
                
                if ismember(thetaG(iTheta), [0 pi])
                    text(cos(thetaG(iTheta))*(1+thetaCount*.1),...
                        sin(thetaG(iTheta))*(1+thetaCount*.1)+.1,num2str(thetaG(iTheta)))
                else
                    text(cos(thetaG(iTheta))*(1+thetaCount*.1),...
                        sin(thetaG(iTheta))*(1+thetaCount*.1),num2str(thetaG(iTheta)))
                end
            end
            thetaCount = thetaCount + 1;
        end
        
        % get maximum number of points to set axis limits
        maxCount = max([maxCount thetaCount]);
    end
    
    % set axis limits
    xlim([-(1+maxCount*.1) 1+maxCount*.1])
    ylim([-(1+maxCount*.1) 1+maxCount*.1])
    
    % format figure
    title(sprintf('theta locations, v = %.3f', v))
    set(get(gca,'children'),'linewidth',2);
    set(get(gcf,'children'),'linewidth',2,'fontsize',15);
    
    %% add more to plot if var theta not empty
    if ~isempty(varTheta)
        nVarThetas = 100;
        varTheta = sort(varTheta,'ascend');
        varThetaVals = varTheta(1):diff(varTheta)/nVarThetas:varTheta(2);
        v2 = zeros(length(varThetaVals),1);
        
        for iVarTheta = 1:length(varThetaVals)
            v2(iVarTheta) = potentialFunction([theta,varThetaVals(iVarTheta)]);
        end
        
        % add varying theta to figure
        cometSr(cos(varThetaVals), sin(varThetaVals),.1,.01,'g')
        
        % create new figure of potential as varTheta varies
        subplot(1,2,2)
        plot(varThetaVals,v2,'g'), axis square
        
        % format figure
        title('potential function as theta varies')
        xlabel('variable theta radial position')
        ylabel('potential (v)')
        
        set(get(gca,'children'),'linewidth',2);
        set(get(gcf,'children'),'linewidth',2,'fontsize',15);
        
    end
end


