%                       newtonRoot.m
%
% A Matlab script that implements Newton's method for 
% finding the roots of the non-linear equation x^2 - 2.0
%
% This is not a robust code - there is no code that 
% terminates the iteration if too many iterates are taken. 
%
fstring = 'sin(x/2) - 1';      % target function 
dfstring = 'cos(x/2)/2';       % target functions derivative

x0  = 3.0;               % initial guess
eps = 1.0e-8;             % stopping tolerance
format long;              % print out in long format
format compact;           % suppress line feeds

xn  = x0;

eval(['x = xn;',fstring,';']);     % evaluate f  at xn
fn = ans; 
eval(['x = xn;',dfstring,';']);    % evaluate f' at xn
dfn = ans; 

error_estim=abs(fn/dfn);
iter = 0;


while(error_estim > eps) 
   last_xn = xn;
   xn  = xn - fn/dfn;      % Newton iteration 
   error_estim = abs(fn/dfn);#abs(xn - last_xn);
   eval(['x = xn;',fstring,';']);     % evaluate the f  at xn
   fn = ans; 
   eval(['x = xn;',dfstring,';']);    % evaluate the f' at xn
   dfn = ans; 
   iter = iter + 1;
end

%
% Print out final results
%
disp(sprintf(['Approximate root of %s    : %-15.10f '],fstring,xn))
disp(sprintf(['Initial iterate           : %-15.10f '],x0))
disp(sprintf(['Residual                  : %-15.10e '],fn))
disp(sprintf(['Approximation error bound : %-15.10e'],error_estim))
disp(sprintf(['Iterations required       : %-5d'],iter))
