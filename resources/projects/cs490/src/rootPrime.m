function rootprime = rootprime(t, alpha, K, beta, xt, xm, N)
% ROOTPRIME(t, alpha, K, beta, xt, xm, N) Root Function Derivative
%
% General evaluation of the rootfunc'(t) 
%
% Takes in the variables in order: time, patch growth
% rate, patch carrying capacity, consuming rate, 
% travel cost, metabolic rate, and number of
% resource patches

rstar = (1 - beta/alpha/N)*K;
deltaBA = beta - alpha;
exppart = (alpha*rstar + K*deltaBA)*exp(deltaBA*t);
gpp = (beta*K/alpha*(deltaBA^2)*exppart) .* ...
      (-alpha*rstar./(exppart - alpha*rstar).^2);
gp = gainprime(t, alpha, K, beta, xt, xm, N);
g = gain(t, alpha, K, beta, xt, xm, N);
rootprime = gpp - (gp.*t - g)./t.^2;