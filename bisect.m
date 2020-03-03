%                       bisect.m
%
% A Matlab script that implements the bisection method for 
% finding the roots of the non-linear equation (x-1)*(x-2)*(x-3)
% 
%
% This is not a "robust" code, it does not check that the initial
% interval contains a root. You may want to add this feature.
%
%
% Matlab tricks :
%
% Using the eval function to evaluate a function specified by 
% a string. This is an alternative to creating an m-file with
% the function specified. 
%
% Using sprintf for formatted output. The []'s are being used to 
% concatenate the formatting string. 
%
% Version 1/10/2018 
% Math 151A 

fstring  = 'x*x*x*x*x*x-x-1';     % target function specified by
                                    % a string
                                    
maximalIterations = 1000;           % Maximal number of iterations
a   = 1.0;                         % left starting endpoint
b   = 2.0;                         % right starting endpoint

rootEps     = 1.0e-06;              % root error bound tolerance
residualEps = 1.0e-06;              % residual error bound 

iter = 0;

eval(['x = a;',fstring,';']); % evaluate the f at a
fa = ans;

eval(['x = b;',fstring,';']); % evaluate the f at b
fb = ans;

% Check if initial endpoints are roots 

if(abs(fa) < residualEps)
  disp(sprintf(['Approximate root of ',fstring,' is %-15.10f'],a));
  disp(sprintf('Residual =  %-15.10e',abs(fa)));
  return
end
  
if(abs(fb) < residualEps)
  disp(sprintf(['Approximate root of ',fstring,' is %-15.10f'],b));
  disp(sprintf('Residual =  %-15.10e',abs(fb)));
  return
end 

 

while(iter < maximalIterations)  

   c = (a+b)/2.0;                     % midpoint =  approximate root
   
   disp(sprintf(['Step  %ld : Approximate root = %-15.10f'],iter,c));
   
   
   eval(['x = c;',fstring,';']);      % evaluate the function at c
   fc = ans;

 
   if((b-a)/2.0 < rootEps)            % check root error bound
    break;
   end
   
   if(abs(fc) < residualEps)          % check residual 
    break;
   end
   
   if(fa*fc < 0)  % a root lies in the left interval
    b  = c;
    fb = fc;
   else           % root lies in right interval
    a  = c;
    fa = fc;
   end

   iter = iter + 1;
end

if(iter == maximalIterations) 
  disp('XXXX Warning XXXX')
  disp('Maximial Number of iterations taken');
  disp('Results may be inaccurate');
  disp('XXXXXXXXXXXX')
  disp(' ')
end

% 
% Using disp(...) so that "ans =" is not displayed
%  
disp(' ');
disp(sprintf(['Approximate root of ',fstring,' is %-15.10f'],c));
disp(sprintf('Error bound =  %-15.10e',(b-a)/2.0));
disp(sprintf('Residual    =  %-15.10e',abs(fc)));
disp(sprintf('Iterations  =  %-10d',iter));


    
