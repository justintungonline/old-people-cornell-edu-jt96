function intoptimize = intoptimize()
% INTOPTIMIZE Root finding for Interval function
% 
% Finds the optimal residence interval for different
% numbers of resource patches N = 3, 5, 10, 20
% using the Interval Newton Method 

% Parameter settings
alpha = newInterval(0.05, 1); beta = newInterval(0.1, 10);
xt = newInterval(0.1, 20); xm = newInterval(0.01, 5);
K = 1;

% Search interval
searchInt = infsup(2, 20);
N = [3 5 10 20];
roots = cell(4,1); i = 1;
for i = 1:4
   roots{i} = intNewton(searchInt, alpha, K, beta, xt, xm, N(i), 100);
end
disp('Resource  Optimal Residence Time          F-P Approx')
disp(' Patches')
disp('====================================================')
for i = 1:4
   a = inf(roots{i}); b = sup(roots{i});
   midab = mid(roots{i});
   disp(sprintf([' %2.0f     [%2.10f, %2.10f]' ...
        '    %2.10f'],N(i),a,b,midab))
end