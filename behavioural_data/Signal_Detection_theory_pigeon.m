% find False ALArm and Hit using ROC method
clear all
close all
for i=1:8
    load(['sub0',num2str(i)])
    % Calculate hits and false alarms
    HIT(i) = sum(strcmp(trials.trial_type , 'Hit'))/(length(trials.trial_type)/2);
    FA(i) = sum(strcmp(trials.trial_type , 'FA'))/(length(trials.trial_type)/2);
    % Show the simulated values in the table
    disp(' ');
    fprintf('Simulation of  sub0%d',i);
    disp('           |         Response     |')
    disp('  Signal   |  "Yes"    |  "No"    |')
    disp('  ---------------------------------')
    fprintf('  Go  |   %3.1f%%   |   %3.1f   |\n',100*HIT(i),100*(1-HIT(i)));
    disp('  ---------+-----------+----------|');
    fprintf('  NoGo   |   %3.1f    |   %3.1f   |\n',100*FA(i),100*(1-FA(i)));
    disp('  ---------------------------------');

    % calculating d-prime from pHit and pCR
    zHIT(i) = norminv(HIT(i));
    zFA(i) = norminv(FA(i));
    dPrime(i) = zHIT(i)-zFA(i);
    PC(i) = (HIT(i) + (1-FA(i)))/2;  %proportion correct
end
%% plot
C=0.6;% color of surface
figure
y=[0 ;1; 1];
x=[0 ;0; 1];
patch(x,y,C)
hold on
plot([0,1],[0,1],'k:','LineWidth',1)
plot([0,1],[0.5,0.5],'k:','LineWidth',1)
plot([0.5,0.5],[0,1],'k:','LineWidth',1)
plot(FA,HIT,'ko','MarkerSize',6,'MarkerFaceColor',[255/255 102/255 102/255])
set(gca,'XLim',[0,1]);
set(gca,'YLim',[0,1]);
axis square
xlabel('FA Rate');
ylabel('Hit Rate');
box on
