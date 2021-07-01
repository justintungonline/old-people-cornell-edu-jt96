function gain = gain(t, alpha, K, beta, xt, xm, N)
% GAIN(t, alpha, K, beta, xt, xm, N) Gain Function
%
% General evaluation of the g(t) function which 
% takes in the variables in order: time, patch growth
% rate, patch carrying capacity, consuming rate, 
% travel cost, metabolic rate, and number of
% resource patches

rstar = (1 - beta/alpha/N)*K;
deltaBA = beta - alpha;
num = (alpha*rstar + ...
   	 K*(deltaBA))*exp(deltaBA*t) - ... 
  		 alpha*rstar;
denom = K*deltaBA;
inLog = num/denom;
gain = (beta*K/alpha)*(log(inLog) - deltaBA*t) - ...
       (xt + xm*t);