clearvars
clc
close all

N= [100, 25];
c= 0.01
e=0.005
d=0.24
r=0.48
dt=0.01
% T=[0:dt:100]
T=[0 100]

F= @(t,y)[y(1)*r-c*y(2)*y(1);y(2)*(-d)+e*y(2)*y(1)];

ode45(F,T,N)
