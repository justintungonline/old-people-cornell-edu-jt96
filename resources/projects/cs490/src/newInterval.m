function newInterval = newInterval(c, p)
% NEWINTERVAL  Interval creator
%
% Creates a new interval given a centerpoint c and
% a percentage uncertainty p

p_uncert = p/100;
inf = c - p_uncert*abs(c);
sup = c + p_uncert*abs(c);
newInterval = infsup(inf, sup);