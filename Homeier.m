function Homeier()
tic;
syms x;
stri = input('Give an equation in x: ','s'); %Enter the Function here 
k = horner(str2sym(stri)); %Convert function to horner form
g=diff(k); %The Derivative of the Function
n=input('Enter the number of decimal places:');
epsilon = 5*10^-(n+1); %tolerance
x0 = input('Enter the intial approximation:');
for i=1:100
     f0=vpa(subs(k,x,x0)); %Calculating the value of function at x0
     f0_der=vpa(subs(g,x,x0)); %Calculating the value of function derivative at x0
  y=x0-(f0)/(f0_der); %value of y at x0
  y_derval=vpa(subs(g,x,y)); %derivative of f which is declared g and its value at y
  h=x0-0.5*(f0)*(1/(f0_der)+1/(y_derval)); %Homeier Method formula
err=abs(h-x0);
if err<epsilon %checking the amount of error at each iteration
break
end
x0=h;
end
h = h - rem(h,10^-n); %Displaying upto required decimal places
fprintf('The Root is : %f \n',h);
fprintf('No. of Iterations : %d\n',i);
toc;