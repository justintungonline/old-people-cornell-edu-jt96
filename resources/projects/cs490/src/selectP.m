function [alpha, beta, xt, xm] = selectP()
% SELECTP  Used to set fp model parameters from user input

disp('Please select fixed-point values')
alpha = input('alpha: ')
beta = input('beta: ')
xt = input('xt: ')
xm = input('xm: ')