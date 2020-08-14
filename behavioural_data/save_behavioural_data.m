% function [StimulusResults]=BehavioralResults_ColorDiscrimination(InPut)
%20200812
clear all
close all
InPut='sub008';
subj_ID ='sub08';
load(InPut)
%
StimOnset1 = Results.TimeStartEvents_S01;
StimOffset1 = Results.TimeEndEvents_S01;
TrialOnset1 =  Results.TimeStartTrials_S01;
TrialOffset1 = Results.TimeEndTrials_S01;
%% reward information
reward_onset1 = nan(1,length(TrialOnset1));
reward_offset1 = nan(1,length(TrialOnset1));
for i = 1 : length(Results.time_Relais1_Cue_On_S01)
    c=0;
    for j =1 : length(Results.LightIntensity_S01)
        if Results.time_Relais1_Cue_On_S01 (i) < TrialOffset1(j) && c==0
            reward_onset1(j) = Results.time_Relais1_Cue_On_S01(i);
            reward_offset1(j) = Results.time_Relais1_Cue_Off_S01(i);
            c=1;
        end
        
    end
end

%% mandibulation info (pigeon response time)
PRT=Results.TimePigeonResponse;

for i = 1 : length(Results.LightIntensity_S01)
    M= PRT < TrialOffset1(i);
    M2=PRT > TrialOnset1(i);
    PR=PRT(M & M2);

    if ~isempty(PR)
        PigenRespTime1{i} = PR(:);
    else
        PigenRespTime1{i}=[];
    end
    clear PR
end
if isempty(PigenRespTime1)
    disp('There is no pigeon response.')
end
trials1 = 1:length(PigenRespTime1);
%% reaction time
ReactionTime1=nan(1,length(PigenRespTime1));
for i = 1 : length(PigenRespTime1)
    PP= PigenRespTime1{i};
    M=PP>StimOnset1(i);
    M2=PP<StimOffset1(i);
    Cue=PP(M & M2);
    
    if ~isempty(Cue)
        ReactionTime1(i)=Cue(1)-StimOnset1(i);
    end
    clear Cue
end
%% behavioural performance

for i = 1 : length(ReactionTime1)
    RT= ReactionTime1(i);
    if ~isnan(RT) && Results.ColorNum_S01(i)==info.Pigeon_Group
        BP1{i} = 'Hit';
    elseif isnan(RT) && Results.ColorNum_S01(i)==info.Pigeon_Group
        BP1{i} = 'Miss';
    elseif ~isnan(RT) && Results.ColorNum_S01(i)~=info.Pigeon_Group
        BP1{i} = 'FA';
    elseif isnan(RT) && Results.ColorNum_S01(i)~=info.Pigeon_Group
        BP1{i} = 'CR';
    end
end
%% session2
StimOnset2 = Results.TimeStartEvents_S02;
StimOffset2 = Results.TimeEndEvents_S02;
TrialOnset2 =  Results.TimeStartTrials_S02;
TrialOffset2 = Results.TimeEndTrials_S02;
reward_onset2 = nan(1,length(TrialOnset2));
reward_offset2 = nan(1,length(TrialOnset2));
%% reard information
for i = 1 : length(Results.time_Relais1_Cue_On_S02)
    c=0;
    for j =1 : length(Results.LightIntensity_S02)
        if Results.time_Relais1_Cue_On_S02(i) < TrialOffset2(j) && c==0
            reward_onset2(j) = Results.time_Relais1_Cue_On_S02(i);
            reward_offset2(j) = Results.time_Relais1_Cue_Off_S02(i);
            c=1;
        end
        
    end
end
%% Mandibulatio ( pigeon response time)
PRT=Results.TimePigeonResponse;
for i = 1 : length(Results.LightIntensity_S02)
    M= PRT < TrialOffset2(i);
    M2=PRT > TrialOnset2(i);
    PR=PRT(M & M2);

    if ~isempty(PR)
        PigenRespTime2{i} = PR(:);
    else
        PigenRespTime2{i}=[];
    end
    clear PR
end
if isempty(PigenRespTime2)
    disp('There is no pigeon response.')
end
trials2 = 1+length(PigenRespTime1):length(PigenRespTime1)+length(PigenRespTime2);

%% reaction time
ReactionTime2=nan(1,length(PigenRespTime2));
for i = 1 : length(PigenRespTime2)
    PP= PigenRespTime2{i};
    M=PP>StimOnset2(i);
    M2=PP<StimOffset2(i);
    Cue=PP(M & M2);
    
    if ~isempty(Cue)
        ReactionTime2(i)=Cue(1)-StimOnset2(i);
    end
    clear Cue
end

%% behavioural performance

for i = 1 : length(ReactionTime2)
    RT= ReactionTime2(i);
    if ~isnan(RT) && Results.ColorNum_S02(i)==info.Pigeon_Group
        BP2{i} = 'Hit';
    elseif isnan(RT) && Results.ColorNum_S02(i)==info.Pigeon_Group
        BP2{i} = 'Miss';
    elseif ~isnan(RT) && Results.ColorNum_S02(i)~=info.Pigeon_Group
        BP2{i} = 'FA';
    elseif isnan(RT) && Results.ColorNum_S02(i)~=info.Pigeon_Group
        BP2{i} = 'CR';
    end
end
%% light intensity
for i = 1 : length(Results.LightIntensity_S01)
    
    if (Results.LightIntensity_S01(i)==100)
        light_color1{i} = 'red';
        light_intensity1(i) = 100;
    elseif (Results.LightIntensity_S01(i)==25)
        light_color1{i} = 'red';
        light_intensity1(i) = 25;
    elseif (Results.LightIntensity_S01(i)==92.5)
        light_color1{i} = 'green';
        light_intensity1(i) = 100;
    elseif (Results.LightIntensity_S01(i)==24.4)
        light_color1{i} = 'green';
        light_intensity1(i) = 25;
    end
end
for i = 1 : length(Results.LightIntensity_S02)
    
    if (Results.LightIntensity_S02(i)==100)
        light_color2{i} = 'red';
        light_intensity2(i) = 100;
    elseif (Results.LightIntensity_S02(i)==25)
        light_color2{i} = 'red';
        light_intensity2(i) = 25;
    elseif (Results.LightIntensity_S02(i)==92.5)
        light_color2{i} = 'green';
        light_intensity2(i) = 100;
    elseif (Results.LightIntensity_S02(i)==24.4)
        light_color2{i} = 'green';
        light_intensity2(i) = 25;
    end
end

%%
trials = [trials1, trials2]';
mandibulation_time =[PigenRespTime1, PigenRespTime2]';
stim_onset = [StimOnset1, StimOnset2]';
stim_offset = [StimOffset1,StimOffset2]';
trial_onset = [TrialOnset1, TrialOnset2]';
trial_offset =[TrialOffset1,TrialOffset2]';
light_color =[light_color1,light_color2]';
light_intensity = [light_intensity1,light_intensity2]';
reward_onset = [reward_onset1, reward_onset2]';
reward_offset = [reward_offset1, reward_offset2]';
reaction_time = [ReactionTime1,ReactionTime2]';
trial_type = [BP1,BP2]';
% var1= {'trials','trial_onset','trial_offset','stim_onset','stim_offset','mandibulation_time','light_color','light_intensity'}
trials = table (trials, trial_onset,trial_offset,stim_onset,stim_offset,mandibulation_time,reaction_time,reward_onset,reward_offset,light_color,light_intensity,trial_type)
%% info
r.num_trials = info.NumCueTrials_S01+info.NumCueTrials_S02;
r.initial_resting_state_volume = info.InitialRestingStateVol;
r.middle_resting_state_volume = info.MedialRestingStateVol;
r.final_resting_state_volume = info.FinalRestingStateVol;
r.TR = 4;

r.stim_length = info.CueLength;
if info.Pigeon_Group == 1
    r.pigeon_group ='red';
else
    r.pigeon_group ='green';
end
r.num_trial_volume = info.TrialVolume;
r.num_volume = info.TrialVolume *r.num_trials+r.initial_resting_state_volume+r.middle_resting_state_volume+r.final_resting_state_volume;

info =r;
save (subj_ID,'info', 'trials')
