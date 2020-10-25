function Ans = GaussSeidelMethod( A ,B )

%checking matrix A
 
[na , ma ] = size (A);
if na ~= ma
    disp('ERROR: Matrix A must be a nxn matrix');
    return
end
 
% checking matrix B
 
[nb , mb ] = size (B);
if nb ~= na || mb~=1
   disp( 'ERROR: Matrix B must be a column matrix');
   return
end
 
% Separation of matrix A into lower triangular and upper triangular matrices
 
% A = D + L + U
 
D = diag(diag(A));
L = tril(A)- D;
U = triu(A)- D;
 
% check for convergence condition for Gauss-Seidel method
 
e= max(eig(-inv(D+L)*(U)));
if abs(e) >= 1
    disp ('Since the modulus of the largest Eigen value of iterative matrix is not less than 1') 
    disp ('this process is not convergent.')
    return
end
 
X0 = ones(na,1); %setting initial x column as 1
tol = 0.0001;
k= 1;

X( : , 1 ) = X0;
err= 1000000000*rand(na,1);% initial error assumption for looping
while sum(abs(err) >= tol) ~= zeros(na,1)
    X ( : ,k+ 1 ) = -inv(D+L)*(U)*X( : ,k) + (D+L)\B;% Gauss-Seidel formula
    err = X( :,k+1) - X( :, k);% finding error
    k= k+1;

end

fprintf ('The final answer obtained after %g iterations is  \n', k);
Ans = X( : ,k);


 




