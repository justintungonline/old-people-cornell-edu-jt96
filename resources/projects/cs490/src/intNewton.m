function root = intNewton(x, alpha, K, beta, xt, xm, N, nEvalsMax)
% INTNEWTON(a, b) Interval Root Finder
%
% Algorithm based on Interval Newton method by Kulish (pg. 35-37)
% x defines a bracketing interval that contains a root
% of the function rootfunc while other parameters are passed
% into rootfunc
%
% Convergence based on nvalsMax (maximum number of iterations)
% since we do not know the optimal residence interval size

fx = rootfunc(x, alpha, K, beta, xt, xm, N);
if 0 < inf(fx) | 0 > sup(fx)
   disp('Initial interval is not bracketing.')
   disp('Please choose another interval or check function')
   root = 'Invalid Root';
else
   i = 0;
   while i < nEvalsMax
      x = UnitedNewtonStep(x, alpha, K, beta, xt, xm, N);
      i = i + 1;
   end
   root = x;
end