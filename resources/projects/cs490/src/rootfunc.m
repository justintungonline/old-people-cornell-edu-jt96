function rootfunc = rootfunc(t, alpha, K, beta, xt, xm, N)
% ROOTFUNC(t, alpha, K, beta, xt, xm, N) Root Function
%
% This function the one we want to find the root of
% Takes in the variables in order: time, patch growth
% rate, patch carrying capacity, consuming rate, 
% travel cost, metabolic rate, and number of
% resource patches

gp = gainprime(t, alpha, K, beta, xt, xm, N);
g  = gain(t, alpha, K, beta, xt, xm, N);
rootfunc = gp - g./t;