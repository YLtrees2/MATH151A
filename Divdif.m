%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Routine for computing the divided difference coefficients
%  of the Newton form of an interpolating polynomial.
%
%  fval,x are double vectors of size n+1
%
%  On entry x(i) = interpolation points
%
%  fval(i) = f(x(i)), where f(x) is the function being interpolated
%
%  Returned d(i) = the ith-1 divided difference of f (= f[x_1,x_2,...,x_i-1])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
function [d] = Divdif (x,fval,n)
%
%   Initialize d with the function values
%
    d = zeros(1,n+1);
    for(i = 1:(n+1))
       d(i) = fval(i);
    end 
    
    for(i = 2:(n+1))
      for(j=(n+1):-1:i)
         d(j) = (d(j)-d(j-1))/(x(j)-x(j-i+1));
      end
    end
    
%
%   You have to implement the rest of the  method ...
% 
   