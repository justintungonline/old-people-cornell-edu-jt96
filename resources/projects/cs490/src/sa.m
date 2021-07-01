function sa = sa()
% SA Stability Analysis
% 
% Finds the optimal residence interval for different
% numbers of resource patches N = 3, 5, 10, 20
% using the Interval Newton Method 
% Conducts gradual increase in uncertainty of a given
% parameter until at least of the roots returned is the 
% initial interval with 5 Newton iterations

% Parameter settings
alpha = newInterval(0.05, 0); beta = newInterval(0.1, 0);
xt = newInterval(0.1, 0); xm = newInterval(0.01, 0);
K = 1;

% Search interval
searchInt = infsup(4, 16);
N = [3 5 10 20];
p = 0; inc = 2; stop = 0;
while stop ~= 1
   % Choose parameter to increment percent uncertainty
   p = p + inc
   alpha = newInterval(0.05, p);
	for i = 1:4
      root = intNewton(searchInt, alpha, K, beta, xt, xm, N(i), 5);
      size = sup(root) - inf(root);
      if size == 12
         stop = 1;
         Nstop = N(i);
      end
   end
end
a = inf(alpha); b = sup(alpha);
disp(sprintf('Model Failure at N = %2.0f', Nstop))
disp(sprintf('For parameter alpha with value [%5.7f, %5.7f]',a,b))
disp(sprintf('with percentage uncertainty: %3.0f',p));
