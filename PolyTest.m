%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 			      PolyTest.m
%           A polynomial interpolation test script.
%
% Program for Math 151A Assignment %6                          2/6/18
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%   n must be specified at the command prompt before executing this
%   routine.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               TARGET FUNCTION TO BE INTERPOLATED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
fstring = 'sin(x)+0.001*sin(100*x)';   % target function specified by a string

%
% Construct some interpolation data 
%
a = 0.0;
b = 1.0;

n = 30;

h = (b-a)/n;

fval = zeros(n+1,1);
xval = zeros(n+1,1);

xval = a:h:b;      % use : notation to create x data 
for i = 1:(n+1)
   eval(['x = xval(i);',fstring,';']);  % evaluate the function at x   
   fval(i) = ans;
end

%
% Obtain the divided difference coefficients
%

d = Divdif(xval,fval,n);

%
% Evaluate the error and plot the results
%

nSample  = 20;
xxval    = a:(b-a)/nSample:b;

yExact   = zeros(1,nSample+1);       % evaluate function 
for i = 1:length(xxval)
   eval(['x = xxval(i);',fstring,';']);    
   yExact(i) = ans;
end

yApprx   = zeros(1,nSample+1);       % evaluate approximate function 
for i = 1:length(xxval)    
   yApprx(i) = Interp(xxval(i),xval,d,n);
end

%
% compute the maximal error. 
% Here max and abs are working on 
% the complete vectors yExact and yApprx.
%
errMax   = max(abs(yExact-yApprx));
%
% print out the error

disp(sprintf('\n'))
disp(sprintf(['Target function : f(x) =  %s '],fstring))
disp(sprintf('\n'))
disp(sprintf('Error of interpolant of degree %d  : %-15.10e \n',n,errMax))
%
% A quick plot of the results 
%
yPlotMin =  -2.0;
yPlotMax =   2.0;
xPlotMin =     a;
xPlotMax =     b;

plot(xxval,yExact,'b-'); % the target function 

axis([xPlotMin,xPlotMax,yPlotMin,yPlotMax]);
hold on;
plot(xxval,yApprx,'r-'); % the approx. function 
hold on;
plot(xval,fval,'ko'); % the interp. nodes 
legend('f(x)','Interpolant','Interpolation nodes')

hold off;





