clear all;close all; clc;
%Defining the values of invovled parameters 
a = 3; b = 14; c = 3.9; a1 = 0.85; a2 = 0.85; a3 = 0.85;
%Initial conditions
t0 = 0; x0 = 0.2; y0 = 0.4; z0 = 0.2;
t(1) = t0; x(1) = x0; y(1) = y0; z(1) = z0;
%step size and number of iteration
N = 1000; h = 80/N;
c10 = ((exp(a*h)-1)/(a))^(-a1); c20 = (exp(h)-1)^(-a2); c30 = ((exp(c*h)-1)/(c))^(-a3);
c1(1)= c10; c2(1)=c20; c3(1)=c30; sum1(1) = 0; sum2(1) = 0; sum3(1) = 0; 
for   i = 1:N
for   j = 2:i+1
    t(i+1) = t(i)+h;
    c1(j) = (1-(1+a1)/(j-1))*c1(j-1); c2(j) = (1-(1+a2)/(j-1))*c2(j-1); c3(j) = (1-(1+a3)/(j-1))*c3(j-1);
    sum1(j) = sum1(j-1) + sum(c1(j)*x(i+2-j));
    sum2(j) = sum2(j-1) + sum(c2(j)*y(i+2-j));
    sum3(j) = sum3(j-1) + sum(c3(j)*z(i+2-j));
    x(i+1) = (-sum1(j)+a*y(i)+b*y(i)*z(i))/(c10+a);
    y(i+1) = (-sum2(j)+4*x(i+1)*z(i))/(c20+1+10*(y(i))^2);
    z(i+1) = (-sum3(j)+c*z(i)-x(i+1)*y(i+1))/(c30);
end
end
plot(t,x)