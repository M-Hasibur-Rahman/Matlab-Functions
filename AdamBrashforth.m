function [x,y] = AdamBrashforth(f,xR,yIn,n)
% Adam-Brashforth 3rd order method. Runga-kutta 3rd order method was used
% to calculate the the starting values Y1, Y2 
% Terminologies:
% h - strip width
% x - has value of x (row vector)
% y - has values at kth row with the approximate solution at x(k)
% xR - range of x [x1,x2]
% yIn - initial value of y
% n - no. of intervals/strips
% f - any first order differential equations of form Y' = f(x,Y)

% example input:
% f = @(x,y) cos(x*y)
% AdamBrashforth(f, [0,3], 1, 12)


h = (xR(2) - xR(1)) / n;  % strip width
x(1) = xR(1);             % getting the x1 value from the range 
y(:,1) = yIn;             % setting initial Y0 value 

k = 1;                    % getting Y1 value using Runga-Kutta 3rd order method
    K1 = h * f(x(k), y(:,k));

    K2 = h * f(x(k) + h * 0.5, y(:,k) + K1 * 0.5);

    K3 = h * f(x(k) + h, y(:,k) - K1 + 2 * K2);

    x(1,k+1) = x(1,k) + h;
    y(:,k+1) = y(:,k) + (1/6) * (K1 + 4 * K2 + K3); 

k = 2;                    % getting Y2 value using Runga-Kutta 3rd order method
    K1 = h * f(x(k), y(:,k));        

    K2 = h * f(x(k) + h * 0.5, y(:,k) + K1 * 0.5);

    K3 = h * f(x(k) + h, y(:,k) - K1 +2 * K2);

    x(1,k+1) = x(1,k) + h;
    y(:,k+1) = y(:,k) + (1/6) * (K1 + 4 * K2 + K3);

for k = 3:n               % getting rest Y values from Adam-Bashforth 3rd order method
    x(1,k+1) = x(1,k) + h;
    y(:,k+1) = y(:,k) + 23/12 * h * f(x(k), y(:,k)) - 16/12 * h * f(x(k-1), y(:,k-1)) ...
               + 5/12 * h * f(x(k-2), y(:,k-2));
end
[tx, yx] = ode45(f, xR, yIn);  % plotting solution against ode45 function for comparison purposes
plot(x,y,'o-', tx, yx, '--');
xlabel('x'); 
ylabel('y'); 
legend({'Adams-Brashforth','ode45'},'Location','east');
end