function root = Bisection(a, b, alpha, K, beta, xt, xm, N)
% BISECTION(a, b) Bisection Root Finder
%
% Algorithm based on Bisection method by Van Loan (pg. 281)
% a and b define a bracketing interval that contains a root
% of the function rootfunc while other parameters are passed
% into rootfunc
%
% Convergence is set so that tolerance is never smaller than
% than the spacing between the floating point numbers a and b

fa = rootfunc(a, alpha, K, beta, xt, xm, N); 
fb = rootfunc(b, alpha, K, beta, xt, xm, N); 
delta = 1/500000;
if fa*fb > 0
   disp('Initial interval is not bracketing.')
   disp('Please choose another interval or check function')
   root = 'Invalid Root';
else 
	while abs(a-b) > delta+eps*max(abs(a),abs(b))
   	mid = (a+b)/2;
	   fmid = rootfunc(mid, alpha, K, beta, xt, xm, N);    
   	if fa*fmid<=0
	      % There is a root in [a,mid].
      	b  = mid; 
   	   fb = fmid;
	   else
   	   % There is a root in [mid,b].
      	a  = mid; 
      	fa = fmid;
	   end  
	end
   root = (a+b)/2;
end