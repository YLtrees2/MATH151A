%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 		      Math 151A  IntegateTest.m               
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% An Matlab script that tests the composite Trapezoidal rule routine 
% for approximating the integral of a function over an interval [a,b].
%
% The composite trapezoidal routine is contained in the file 
% trapInt.m.  
%
% 2/21/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    Target Function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
F  = @(x)sqrt(x);
%                  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    Main Routine 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
 
a = 0.0;                    % integral from [a,b]
b = 1.0;
 
true_value=0.6666666666666667; 
 
nRefine = 8;                     % number of refinements
intApp  = zeros(nRefine,1);      % array to hold results for each refinement
                                 % computed approximations to the integral
for i = 1:nRefine                 
	 nPanels   = 2^i;
	 intApp(i) = trapInt(F,a,b,nPanels);
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
fs = [' # panels               Integral                  Error                      Rate of Convergence',sprintf('\n')];
fs =[fs,sprintf('  %-3d                %-15.10e           %-15.10e  \n',2,intApp(1),(true_value-intApp(1)))];
fs =[fs,sprintf('  %-3d                %-15.10e           %-15.10e  \n',4,intApp(2),(true_value-intApp(2)))];
for(i = 3:nRefine)
   nPanels   = 2^i;
   fs =[fs,sprintf('  %-3d                %-15.10e           %-15.10e            %-15.10e  \n',nPanels,intApp(i),(true_value-intApp(i)),log2((intApp(i-1)-intApp(i-2))/(intApp(i)-intApp(i-1))))];
end
fs   % display the results
