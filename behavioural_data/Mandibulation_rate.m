%% mandibulation rate
clear all
close all
MandGo=[];
MandNoGo=[];
for i=1:8
    load(['sub0',num2str(i)])
    hit = strcmp(trials.trial_type,'Hit');
    mand_go = trials.mandibulation_time(hit);
    stim_onset_go = trials.stim_onset(hit);
    stim_offset_go = trials.stim_offset(hit);
    
    FA = strcmp(trials.trial_type,'FA');
    mand_nogo = trials.mandibulation_time(FA);
    stim_onset_nogo = trials.stim_onset(FA);
    stim_offset_nogo = trials.stim_offset(FA);
    
    for j = 1:length(mand_go)
       mand_rate_go(i,j) = length(find(0<(mand_go{j}-stim_onset_go(j)) & (mand_go{j}-stim_onset_go(j)) < (stim_offset_go(j)-stim_onset_go(j))));
    end
    
    for j = 1:length(mand_nogo)
       mand_rate_nogo(i,j) = length(find(0<(mand_nogo{j}-stim_onset_nogo(j)) & (mand_nogo{j}-stim_onset_nogo(j)) < (stim_offset_nogo(j)-stim_onset_nogo(j))));
    end
end 
    
%%
mand_rate_go = mand_rate_go(:);
mand_rate_nogo = mand_rate_nogo(:);
figure
nbin=max(mand_rate_go(:));
h1=histfit(mand_rate_go(mand_rate_go~=0),nbin,'kernel');
hold on
h2=histfit(mand_rate_nogo(mand_rate_nogo~=0),nbin,'kernel');

h1(1).FaceColor=[255/255 102/255 102/255];
h1(1).EdgeColor=[255/255 102/255 102/255];
h1(2).Color=[204/255 0 0];
h2(1).FaceColor=[153/255 255/255 204/255];
h2(1).EdgeColor=[153/255 255/255 204/255];
h2(2).Color=[0 153/255 51/255];
ylabel('# Trials')
xlabel('Mandibulation Rate')

 axis([-0.1 11.1 0 60])
box off
%% mandibulation rate difference between Go and NOGO trials 
[h,p,ci,stats]=ttest2(mand_rate_go,mand_rate_nogo);