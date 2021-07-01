function fpoptimize = fpoptimize()
% FPOPTIMIZE Root finding for fixed point function
% 
% Finds the fixed point optimal residence time for different
% numbers of resource patches N = 3, 5, 10, 20
% using the bisection method

% Parameter settings
alpha = 0.05; beta = 0.1;
xt = 0.1; xm = 0.01;
K = 1;

% Search interval
a = 4; b = 16;
roots = zeros(4,1); i = 1;
N = [3 5 10 20];
for j = N
   roots(i) = Bisection(a, b, alpha, K, beta, xt, xm, j);
   i = i + 1;
end
disp('Resource Patches  Optimal Residence Time')
disp('========================================')
for i = 1:4
   disp(sprintf('     %2.0f      		  %5.10f', N(i), roots(i)))
end