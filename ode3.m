function s = ode3(n,a,b,ya,dya,ddya)
% This solution is used to solve the non homogenous differential eq. by 
% runge kutta (RK2) second order numerical method.
% Eq: 7y''' - 6y'' + 2y' + 5y = 3x
h = (b-a)/(n);            % step size 

x(1) = a;
y2 = zeros(1,n);            % initializing the solution vector
y3 = zeros(1,n);            % initializing the derivative of the solution vector
y4 = zeros(1,n);            % initializing the second derivative

y2(1) = ya;                 % implementing the initial conditions
y3(1) = dya;                % implementing the initial conditions
y4(1) = ddya;               % implementing the initial conditions


% loop for total number of steps
for k = 1:n-1
    
    % defining K1 for all three equaitons
    K21 = h * f1(x(k), y2(k), y3(k), y4(k));
    K31 = h * f2(x(k), y2(k), y3(k), y4(k));
    K41 = h * f3(x(k), y2(k), y3(k), y4(k));

    % defining K2 for all three equations
    K22 = h * f1(x(k)+h/2, y2(k) + K21/2, y3(k) + K31/2, y4(k) + K41/2);
    K32 = h * f2(x(k)+h/2, y2(k) + K21/2, y3(k) + K31/2, y4(k) + K41/2);
    K42 = h * f3(x(k)+h/2, y2(k) + K21/2, y3(k) + K31/2, y4(k) + K41/2);
    
    % solution of three first order ode's
    x(k+1) = a + h * k;         
    y2(k+1) = y2(k) + K22;
    y3(k+1) = y3(k) + K32;
    y4(k+1) = y4(k) + K42;
    
end
s = y2;
end

% first differential 
function out = f1(x,y2,y3,y4)

out = y3;

end

% first differential 
function out = f2(x,y2,y3,y4)

out = y4;

end

% first differential 
function out = f3(x,y2,y3,y4)

out = (1/7)*( 6*y4 - 2*y3 - 5*y2 + 3*x );

end

