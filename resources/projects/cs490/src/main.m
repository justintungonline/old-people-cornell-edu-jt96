function main = main()
% MAIN  Interface for Foraging Model
% 
% Performs fixed point or interval optimization
% and sets model parameters depending on user output
% Default parameters are also available

clc
disp('CS 490 Research Project Fall 2001')
disp('Justin Tung')
disp('Interval Analysis and its Applications')
disp('to Optimization in Behavioural Ecology'); disp(' ')
choice = 0;
while choice ~= 5;
   disp(' ')
   disp('1. Fixed Point Optimization')
   disp('2. IA Optimization')
   disp('3. Graphical Analysis (r(t), root fcns with defaults)')
   disp('4. Query on Model Parameters')
   disp('5. Exit')
   choice = input('Select a choice: '); disp(' ')
   switch choice
	   case 1
         yorn = disparasfp;
         if yorn == 0
            [alpha, beta, xt, xm] = selectP;
         else
            alpha = 0.05; beta = 0.1;
				xt = 0.1; xm = 0.01;
         end
         fpoptimizemain(alpha, beta, xt, xm);
      case 2
         yorn = disparasia;      
         if yorn == 0
            [alpha, beta, xt, xm] = selectPIA;
         else
            alpha = newInterval(0.05, 1); beta = newInterval(0.1, 10);
				xt = newInterval(0.1, 20); xm = newInterval(0.01, 5);
         end
         intoptimizemain(alpha, beta, xt, xm);
      case 3
         ga
         gawmax;   
      case 4
         dispara;
      case 5
      	disp('End')        
      otherwise
         disp('Invalid choice')
      end
   end