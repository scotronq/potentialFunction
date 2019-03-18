% Goal: find pattern in potential function with equidistant radial points
%
% https://mail.google.com/mail/u/0/#inbox/FMfcgxwBVMjbZTdBDwwcNxCpXGspvGrN
%

%% set-up
clear
close all

%% test potential function values
numM = 8;                   % number of "m" to calculate
plotCircleFlag = 1;         % number of "m" to calculate
v = zeros(numM,1);

for m = 1:numM
    [v(m), theta] = potentialFunction(m);
    
    % figure - plot theta on unit circle
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
        title(sprintf('theta locations, m = %i, v = %.3f',m,v(m)))
        set(get(gca,'children'),'linewidth',2)
        set(get(gcf,'children'),'linewidth',2,'fontsize',15)
        pause(1)
        %close all
    end
end

%% Figures
% figure potential function
figure, plot(v,'b*-')
xlabel('m')
ylabel('v')
title('potential function')
set(get(gca,'children'),'linewidth',2)
set(get(gcf,'children'),'linewidth',2,'fontsize',15)

% figure potential function difference
figure, plot(diff(v),'b*-')
xlabel('m')
ylabel('diff(v)')
title('potential function difference')
set(get(gca,'children'),'linewidth',2)
set(get(gcf,'children'),'linewidth',2,'fontsize',15)

