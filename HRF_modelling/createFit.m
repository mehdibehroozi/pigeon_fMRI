function [fitresult] = createFit(x, ydata,lb,ub)
%CREATEFIT3(X,YDATA)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Output: ydata
%  Output:
%      fitresult : a fit object representing the fit.
%%
x = x(:);
ydata = ydata(:);
%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x, ydata );
% Set up fittype and options.
ft = fittype( 'conv_MB(box_car(x),f.*((x.^(a-1).*(c.^a).*exp(-c.*x))./gamma(a)-e.*(x.^(b-1).*(d.^b).*exp(-d.*x))./gamma(b)))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = lb;
opts.StartPoint = [1 1 1 1 1 0.5];
opts.Upper = ub;

% Fit model to data.
[fitresult] = fit( xData, yData, ft, opts );




