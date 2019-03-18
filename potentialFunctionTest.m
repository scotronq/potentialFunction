% Goal: find pattern in potential function with equidistant radial points
% 

%% set-up
clear
close all

%% potential function test parameters
% column 1: number of equidistant points
% column 2: number of times to apply column 1
m = [6 2;4 3];          % 6 equal points twice, 4 equal points 3 times
plotCircleFlag = 1;

% calculate potential function
[v, theta] = potentialFunction(m);

%% figure - plot theta on unit circle
if plotCircleFlag
    figure
    circle(0,0,1), hold on, box on, axis equal
    plot([0 0], [-2 2], 'k-')
    plot([-2 2], [0 0], 'k-')
    
    % get theta groups
    G = findgroups(theta);
    
    maxCount = 0;
    for iG = 1:max(G)
        
        % get groups of overlapping points
        thetaG = theta(G == iG);
        count = 0;
        for iTheta = 1:length(thetaG)
            
            % plot points on circle
            plot(cos(thetaG(iTheta))*(1+count*.1),...
                sin(thetaG(iTheta))*(1+count*.1),'rx')
            
            % add text for position
            if iTheta == length(thetaG)
                count = count + 1;
                
                if ismember(thetaG(iTheta), [0 pi])
                    text(cos(thetaG(iTheta))*(1+count*.1),...
                        sin(thetaG(iTheta))*(1+count*.1)+.1,num2str(thetaG(iTheta)))
                else
                    text(cos(thetaG(iTheta))*(1+count*.1),...
                        sin(thetaG(iTheta))*(1+count*.1),num2str(thetaG(iTheta)))
                end
            end
            count = count + 1;
        end
        
        % get maximum number of points to set axis limits
        maxCount = max([maxCount count]);
    end
    
    % set axis limits
    xlim([-(1+maxCount*.1) 1+maxCount*.1])
    ylim([-(1+maxCount*.1) 1+maxCount*.1])
    
    % format figure
    title(sprintf('theta locations, v = %.3f', v))
    set(get(gca,'children'),'linewidth',2)
    set(get(gcf,'children'),'linewidth',2,'fontsize',15)
end


