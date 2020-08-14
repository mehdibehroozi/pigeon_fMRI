clear all
close all
%% example data
TR = 2;%sec
x= 0:TR:28; % time points
% we will produce an example data based on double-gamma function with parameter of
% FSL, p = [6, 16, 1, 1, 1/16, 1]
FSL_doubleGamaFunc =  ((x.^(6-1).*(1.^6).*exp(-1.*x))./gamma(6)-1/6.*(x.^(16-1).*(1.^16).*exp(-1.*x))./gamma(16));
% box car function to creat 2second function
b = box_car(x);
% 
% figure
% plot(x,FSL_doubleGamaFunc./max(FSL_doubleGamaFunc))
% hold on
% plot(x,b)
%% To apply effecto of 2sec stimulu on HRF we convolved 2second box car with HRF.
ydata = conv_MB(b,FSL_doubleGamaFunc);

%% fit ydata using nonlinear least squer function
% fit function: conv_MB(box_car(x),f.*((x.^(a-1).*(c.^a).*exp(-c.*x))./gamma(a)
%                       -e.*(x.^(b-1).*(d.^b).*exp(-d.*x))./gamma(b)))
lb = [3 12 0.5 0.5 0.1 -Inf];
ub=[10 20 1.5 1.5 0.5 Inf];
[fitresult] = createFit(x, ydata,lb,ub)
% the estimated parameters are same as FSL double gamma function
% parameters: p = [6, 16, 1, 1, 1/16, 1]
% the results demosntrated that fit prcedure is working correctly.
% coeff = [fitresult.a,fitresult.b,fitresult.c,fitresult.d,fitresult.e,fitresult.f]
