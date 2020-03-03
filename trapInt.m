%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                Math 151A       trapInt.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  This function returns the result of applying the composite
%  trapezoidal rule to a function over the interval [a,b] using n panels.
%
%  On entry : F        = Function handle for function being integrated  
%             a        = left integration endpoint
%             b        = right integration endpoint
%             n        = number of panels to use in the integration formula
%
%  Returned : the approximate value of the integral. 
%
%  2/21/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
function [y] = trapInt(F, a, b, n)

h   = (b-a)/n;
sum = 0.0;

sum = F(a)*h/2;
for i = 1:(n-1)
   x_i = a+i*h;
   sum = sum + F(x_i)*h;
end
sum = sum + F(b)*h/2;

y = sum;

