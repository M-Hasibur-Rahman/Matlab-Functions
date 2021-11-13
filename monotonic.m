function [A] = monotonic(M)
% The following function monotomnic(M) takes a matrix M and iterates
% through all rows and outputs the row numbers where monotone properties 
% (either strictly increasing or strictly decreasing) are satisfied.
% Output is presented as a row vector.

A=[];                % initializing row vector

for i = 1:size(M,1)  % iterating over each row

   % Now, using function 'diff' and 'all' we check if the difference  
   % between all elements in a row is either strictly increasing or decreasing
   if ( all(diff(M(i,:)) < 0) || all(diff(M(i,:)) > 0) ) 

        A = [A,i];  % inserting the monotone row numbers to the row vector

   end
end
end