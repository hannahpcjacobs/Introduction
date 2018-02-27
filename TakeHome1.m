clearvars
clc
close all

%% Plots exponential boar population as a function of time for two growth rates
N0=50000; %original population
r1=0.48; %growth rate 1
r2=0.2; %growth rate 2
t=[1:1:50]; %time series in years

N1=N0*exp(r1*t);
N2=N0*exp(r2*t);

semilogy(t,N1,':k')
hold on
semilogy(t,N2,'-r')
title('Boar populations through time')
xlabel('time in years')
ylabel('boar population')
legend('growth rate of 0.48','growth rate of 0.2')
hold off

%% meshgrid test
X=linspace(1,5,5);
Y=linspace(1,10,10);
Y=Y';
[V , W]=meshgrid(X,Y);
H=V+W;
mesh(X,Y,H)

%% Exponential boar population meshgrid
N0=50000; %original population
r=[0.1:0.1:0.5]; %growth rate 
t=[1:1:15]; %time series in years
t=t';
[V,W]=meshgrid(r,t);
N=N0*exp(V.*W);
mesh(V,W,N)
xlabel('growth rate')
ylabel('time in years')
zlabel('boar population')

%% Numerical solution with stop at equilibrium for logistic growth
n=5000; %initial population
N=[n];
r=0.4;  %growth rate
k=11000000; %carrying capacity, in this case the belgium population
t=1;
T=[t];
while r*n*((k-n)/k) > 0.0001*n
    n=r*n*((k-n)/k)+n;
    N=[N,n];
    t=t+1;
    T=[T,t];
end
plot(T,N)
xlabel('time in years')
ylabel('boar population')

%% Slope calculation
load('sierrademml(1).mat');
[A,B]=size(sierrademml);
Slope=zeros(A,B);
r=10;   %resolution in meters
for i=2:A-1       
    for j=2:B-1
        X=((sierrademml(i+1,j)-sierrademml(i-1,j))/(2*r))^2;
        Y=((sierrademml(i,j+1)-sierrademml(i,j-1))/(2*r))^2;
        Slope(i,j)=sqrt(X+Y);
    end
end
imagesc(Slope);
colorbar;
title('Slope map')