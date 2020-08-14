function y=box_car(x)

y=zeros(1,length(x));
f1=find(x<=2);

y(f1)=1;
% numTrials=length(x)./15;
% y1=zeros(1,15);
% y1(1:2)=1;
% 
% y=repmat(y1,1,numTrials)';