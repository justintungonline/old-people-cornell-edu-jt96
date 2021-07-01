function gainprime = gainprime(t, alpha, K, beta, xt, xm, N)
% GAINP(t, alpha, K, beta, xt, xm, N) Gain Function Derivative
%
% General evaluation of the g'(t) function
%
% Takes in the variables in order: time, patch growth
% rate, patch carrying capacity, consuming rate, 
% travel cost, metabolic rate, and number of
% resource patches

rstar = (1 - beta/alpha/N)*K;
deltaBA = beta - alpha;
exppart = (alpha*rstar + K*deltaBA)*exp(deltaBA*t);
num = deltaBA*exppart;
denom = exppart - alpha*rstar;
gainprime = (beta*K/alpha) * (num./denom - deltaBA) - xm;