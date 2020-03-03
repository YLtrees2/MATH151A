%
%     Script diffapp.m : a script for investigating the accuracy
%     of a centered difference approximation of a derivative. 
%
%     151A : Assignment 7

% Specifying target function and it's derivative using @ notation 

f        = @(x)exp(x);
df       = @(x)exp(x);

N = 40;     % number of refinements
p = 1.0;    % evaluation point

% Compute centered difference approximations to
% the derivative of f at x

diff      = zeros(1,N); % vector for difference approximations
diffError = zeros(1,N); % vector for approximation error

h = 1.0;    % initial step size

for(i = 1:N)
   fxph = f(p+h);
   fxmh = f(p-h);
      
   diff(i) = (fxph - fxmh)/(2.0*h); % centered difference approximaiton
   h  = h/2.0;
end
%
% 
for(i = 1:N)
   dfp = df(p);
   diffError(i) = abs(diff(i) - dfp);
end
%
% Print out the error. 
% The fs = [fs, ... ] construction creates one long string variable 
% fs that has all of the output contained in it. 
% ([ ...] is the string concatenation operator.)
% After the loop, fs is printed to display the results. 
% This construction avoids printing out extraneous carriage returns and
% lines with "ans =" in them. 
%


h = 1.0;
#fs = ['     h                     Error    ',sprintf('\n')];
fs = ['     Error            Rate of convergence    ',sprintf('\n')];
fs =[fs,sprintf('%-15.10e       \n',diffError(1))];

for(i = 2:N)
   fs =[fs,sprintf('%-15.10e       %-15.10e \n',diffError(i), log2(diffError(i-1)/diffError(i)))];
   h = h/2.0;
end

fs   % display the results
