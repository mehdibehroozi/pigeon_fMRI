%% histogram of reaction time
clear all
close all
RTGO=[];
RTNOGO=[];
for i=1:8
    load(['sub0',num2str(i)])
    hit = strcmp(trials.trial_type,'Hit');
    RT_go = trials.reaction_time(hit);
    FA = strcmp(trials.trial_type,'FA');
    RT_nogo = trials.reaction_time(FA);
    RTGO = [RTGO;RT_go];
    RTNOGO = [RTNOGO;RT_nogo]; 
end

%% diffrence between GO and NOGO reaction time after puling time
[h p]=ttest2(RTGO,RTNOGO);

%% Histogram
figure
nbin=50;
h1=histfit(RTGO,nbin,'kernel');
hold on
h2=histfit(RTNOGO,nbin,'kernel');

h1(1).FaceColor=[255/255 102/255 102/255];
h1(1).EdgeColor=[255/255 102/255 102/255];
h1(2).Color=[204/255 0 0];
h2(1).FaceColor=[153/255 255/255 204/255];
h2(1).EdgeColor=[153/255 255/255 204/255];
h2(2).Color=[0 153/255 51/255];

 axis([-0.1 2.1 0 35])
 xlabel('Reaction Time (s)')
 ylabel('# Trials')
box off