function x = UnitedNewtonStep(x, alpha, K, beta, xt, xm, N)
% UNITEDNEWTONSTEP  United Extension implementation of Newton Step
% Since we have 5 variables that are intervals, there will be
% 32 combinations of interval endpoints to compute for
% the derivative quantity and 16 combinations for the
% function quantity (16 because xmid is a crisp interval)

midx = mid(x);
% Various endpoints
a = inf(x); 		b = sup(x);
c = inf(alpha);   d = sup(alpha);
e = inf(beta);  	f = sup(beta);
g = inf(xt);  		h = sup(xt);
i = inf(xm);  		j = sup(xm);
num = zeros(16,1); denom = zeros(25,1);
i = 1;
j = 1;
for alpha = [c d]
   for beta = [e f]
      for xt = [g h]
         for xm = [i j]
            num(i) = rootfunc(midx, alpha, K, beta, xt, xm, N);
            i = i + 1;
            for xval = [a b]
               denom(j) = rootprime(xval, alpha, K, beta, xt, xm, N);
               j = j + 1;
            end
         end
      end
   end
end
unitedNum = infsup(min(num), max(num));
unitedDenom = infsup(min(denom), max(denom));
comp = midx - unitedNum/unitedDenom;
x = intersect(comp, x);