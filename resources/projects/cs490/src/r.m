function intakeRate = r(t, alpha, K, beta, xt, xm, N)
% R(t, alpha, K, beta, xt, xm, N) Intake Rate Function
%
% Calculates the net intake rate. Takes in the variables
% in order: time, patch growth rate, patch carrying 
% capacity, consuming rate, travel cost, metabolic rate,
% and number of resource patches

g  = gain(t, alpha, K, beta, xt, xm, N);
intakeRate = g./t;
