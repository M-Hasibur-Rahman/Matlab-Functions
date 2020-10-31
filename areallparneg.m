function c = areallparneg(A)

% The function, 'any' returns a logical vector if all the rows and columns
% (denonted by A<0,1 and A<0,2) is negative or not. The function, 'all' 
% will return true if all of the values of the logical vector returned by  
% 'any' is true and will return false if atleast one of the output of 
% 'any' is false. 

c = all(any(A<0,2)) && all(any(A<0,1)); 

% The && operater will return true for c if both 'all' 
% functions give true and, false if any of the 'all' function 
% is false or if both are false. Thus giving a logical value whether all
% rows and columns of the matrix A are partial-negative.
end

