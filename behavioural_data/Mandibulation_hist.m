%% histogram of mandibulation
clear all
close all
load('mandibulation_data.mat')
nbin = 300;
DAta_go=[];
DAta_nogo=[];
for i=1:8
    DAta_go = [DAta_go, mandibulation_go{i} ];
    DAta_nogo = [DAta_nogo, mandibulation_nogo{i} ];
end

figure
rectangle('Position',[0 0 2 250],'Curvature',0.2,'FaceColor',[255/255 204/255 204/255],'EdgeColor',[255/255 204/255 204/255],'LineWidth',0.1)
hold on 
rectangle('Position',[2 0 0.8 250],'Curvature',0.2,'FaceColor',[224/255 224/255 224/255],'EdgeColor',[224/255 224/255 224/255],'LineWidth',1)
rectangle('Position',[2.8 0 1 250],'Curvature',0.2,'FaceColor',[204/255 255/255 255/255],'EdgeColor',[204/255 255/255 255/255],'LineWidth',0.1)

h1=histfit(DAta_go,nbin,'kernel');

h2=histfit(DAta_nogo,nbin,'kernel');
h1(1).FaceColor=[255/255 102/255 102/255];
h1(1).EdgeColor=[255/255 102/255 102/255];
h1(2).Color=[204/255 0 0];
h2(1).FaceColor=[153/255 255/255 204/255];
h2(1).EdgeColor=[153/255 255/255 204/255];
h2(2).Color=[0 153/255 51/255];
plot([10,10],[0,250],'k:','LineWidth',2)
axis([-1 25 0 260])
xlabel('Time(s)')
ylabel('# Mandibulations')
box off


