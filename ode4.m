function s = ode4(n,a,b,ya,dya,ddya)

h = (b-a)/n;            % step size 

Y(1,1) = a;                 % implementing the initial conditions
Y(1,2) = ya;                % implementing the initial conditions
Y(1,3) = dya;               % implementing the initial conditions
Y(1,4) = ddya;              % implementing the initial conditions
% loop for total number of steps
for k = 1:n

    % defining the parameter as in document
    K = F(Y(k,:)+0.5*h*F(Y(k,:)));
    
    % updating the value at next time interval
    Y(k+1,:) = Y(k,:)+h*K;
    
end
s = (Y(:,2))';
end

function out = F(Y)

% out = [1 Y(3) Y(4) 4*Y(4)-Y(3)-2*Y(2)+2*Y(1)+1];

out = [1 Y(1,3) Y(1,4) 1/7*(6*Y(1,4)-2*Y(1,3)-5*Y(1,2)+3*Y(1,1))];


end