function ga = gawmax()
% GA Graphical Analysis of Root and Intake functions
%
% Plots graphs of the intake and root functions
% for N = 3, 5, 10, 20 and selected t intervals
% as well as spline interpolant curve of optimal
% residence times on intake plot

% Parameter settings
alpha = 0.05; beta = 0.1;
xt = 0.1; xm = 0.01;
K = 1;

figure
% Plotting Intake function
t = linspace(1.3, 40, 300);
w = r(t, alpha, K, beta, xt, xm, 3);
x = r(t, alpha, K, beta, xt, xm, 5);
y = r(t, alpha, K, beta, xt, xm, 10);
z = r(t, alpha, K, beta, xt, xm, 20);
N = [3 5 10 20];
for i = 1:4
   roots(i) = Bisection(4, 16, alpha, K, beta, xt, xm, N(i));
	ft(i) = r(roots(i), alpha, K, beta, xt, xm, N(i));
end
maxt = linspace(roots(1), roots(4)-2);
maxr = spline(roots, ft, maxt);
plot(t,w,'-',t,x,':',t,y,'-.',t,z,'--',maxt,maxr);
title('Intake Rate vs. Residence Time with Maximums')
xlabel('Residence Time'); ylabel('Intake Rate')
legend('N = 3','N = 5','N = 10','N = 20','Optimal Residence Times');