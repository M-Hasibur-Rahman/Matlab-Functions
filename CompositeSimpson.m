function [S] = CompositeSimpson(a,b,c,d,ny,nx)
% A program that computes double integrals with composite simpson rule.
% Parameters and their definitions:
% f - function to be integrated of the form f(x,y)
% a - lower limit for x
% b - upper limit of x
% c - lower limit of y
% d - upper limit of y
% ny - no. of intervals/strips for y, must be even
% nx - no. of intervals/strips for x, must be even
% hx - strip width of x
% hy - strip width of y

% Rest of the below implementation and the use of each variables are 
% explained more in details in the attached report.


f = @(x,y) cos(x*y); % function to be integrated and can be 
% changed according to what function you want to integrate


hx = (b-a) / nx; % strip width of x
hy = (d-c) / ny; % strip widht of y

sum = 0; % summation part of formula

if mod(ny,2)~=0 || mod(nx,2)~=0 || (nx<=2) || (ny<=2)
    % checking if input nx & ny is even and greater than 2.
    % because if those equals 2 then it wont be composite, 
    % it will be the general simpson rule
    
    disp('please make sure nx and ny must be even number and > 2');
    return;
    
end

for i = 0 : ny   % outer integral
    if i == 0 || i == ny 
    % if any of ^ this condition true for our ith term, 
    % coeffecient, coefone = 1 to be used to multiply
    % as required in the composite simpson formula (defined in report)
        
        coefone = 1;

    elseif mod(i,2) == 0
    % if even ith term, coeffecient, coefone = 2 to be used to multiply
    % as required in the composite simpson formula (defined in report)
        
        coefone = 2;

    else
    % if odd ith term, coeffecient, coefone = 4 to be used to multiply
    % as required in the composite simpson formula (defined in report)

        coefone = 4;

    end
    
    % Similar implementation as above but for x
    for j = 0 : nx   % inner integral
        if j == 0 || j == nx 

            coeftwo = 1;

        elseif mod(j,2) == 0

            coeftwo = 2;

        else

            coeftwo = 4;

        end

    x = a + j * hx; % step interval of x to go through each strips of x

    y = c + i * hy; % step interval of y to go through each strips of y

    sum = sum + coefone * coeftwo * f(x,y); % sumation part of formula,
    % we have coefone * coeftwo because when double integration performed, the
    % coefficient, coefone from first integral should be multiplied by the
    % coefficient, coeftwo of the second integral
    end
end

S = (hx * hy) / 9 * sum; % finally, multiplying common factors of both integral

end