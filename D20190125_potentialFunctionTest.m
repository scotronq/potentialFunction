% Goal: find pattern in potential function with equidistant radial points
%
% https://mail.google.com/mail/u/0/#inbox/FMfcgxwBVMjbZTdBDwwcNxCpXGspvGrN
% 

%% set-up
clear
close all

%% potential function test parameters
m = [6 2;4 3];          % 6 equal points twice, 4 equal points 3 times
plotCircleFlag = 1;

% calculate potential function
[v, theta] = potentialFunction(m);

%% figure - plot theta on unit circle
if plotCircleFlag
    figure
    circle(0,0,1), hold on, box on, axis equal
    xlim([-1.5 1.5]), ylim([-1.5 1.5])
    plot([0 0], [-2 2], 'k-')
    plot([-2 2], [0 0], 'k-')
    for iTheta = 1:length(theta)
        plot(cos(theta(iTheta)),sin(theta(iTheta)),'rx')
        text(cos(theta(iTheta)),sin(theta(iTheta)),num2str(theta(iTheta)))
    end
    title(sprintf('theta locations, v = %.3f', v))
    set(get(gca,'children'),'linewidth',2)
    set(get(gcf,'children'),'linewidth',2,'fontsize',15)
end


