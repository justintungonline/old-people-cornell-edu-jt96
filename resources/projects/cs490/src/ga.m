function ga = ga()
% GA Graphical Analysis of Root and Intake functions
%
% Plots graphs of the intake and root functions
% for N = 3, 5, 10, 20 and selected t intervals

close all;
% Parameter settings
alpha = 0.05; beta = 0.1;
xt = 0.1; xm = 0.01;
K = 1;

% Plotting Intake function
t = linspace(1.3, 40, 300);
w = r(t, alpha, K, beta, xt, xm, 3);
x = r(t, alpha, K, beta, xt, xm, 5);
y = r(t, alpha, K, beta, xt, xm, 10);
z = r(t, alpha, K, beta, xt, xm, 20);
N = [3 5 10 20];
plot(t,w,'-',t,x,':',t,y,'-.',t,z,'--');
title('Intake Rate vs. Residence Time')
xlabel('Residence Time'); ylabel('Intake Rate')
legend('N = 3','N = 5','N = 10','N = 20');

% Plotting Root function
figure;
t = linspace(4, 30, 300);
w = rootfunc(t, alpha, K, beta, xt, xm, 3);
x = rootfunc(t, alpha, K, beta, xt, xm, 5);
y = rootfunc(t, alpha, K, beta, xt, xm, 10);
z = rootfunc(t, alpha, K, beta, xt, xm, 20);
z1 = rootprime(t, alpha, K, beta, xt, xm, 3);
z2 = rootprime(t, alpha, K, beta, xt, xm, 5);
z3 = rootprime(t, alpha, K, beta, xt, xm, 10);
z4 = rootprime(t, alpha, K, beta, xt, xm, 20);
plot(t,w,'-',t,x,':',t,y,'-.',t,z,'--',t,0,'-',t,z1,t,z2,t,z3,t,z4);
title('Root Function with its first derivative')
xlabel('Residence Time'); ylabel('Objective Function')
legend('N = 3','N = 5','N = 10','N = 20');