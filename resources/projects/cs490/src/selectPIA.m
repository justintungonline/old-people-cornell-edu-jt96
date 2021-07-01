function [alpha, beta, xt, xm] = selectPIA()
% SELECTP  Used to set interval model parameters from user input

disp('Please select center values and uncertainties')
alpham = input('alpha: ')
alphaU = input('alpha uncertainty: ')
alpha = newInterval(alpham, alphaU);
betam = input('beta: ')
betaU = input('beta uncertainty: ')
beta = newInterval(betam, betaU);
xtm = input('xt: ')
xtU = input('xt uncertainty: ')
xt = newInterval(xtm, xtU);
xmm = input('xm: ')
xmU = input('xm uncertainty: ')
xm = newInterval(xmm, xmU);