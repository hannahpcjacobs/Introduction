clearvars;
clc;
close all;

% Predator - prey 
r=0.48;
c=0.01;
d=0.24;
e=0.005;
N0=100;
W0=25;
t=1;
N=[N0];
W=[W0];
dt=0.1;
totT=100;
T=[t:(totT/dt)]*dt;
time=dt:dt:totT;

for t=2:numel(time)
    dN=((dt*N(t-1))-(r*c*W(t-1)*N(t-1)));
    dW=dt*((-d*W(t-1))+(e*W(t-1)*N(t-1)));
    N(t)=N(t-1)+dN;
    W(t)=W(t-1)+dW;
end
plot(T,N);
title('Population evolution')
xlabel('time (years)')
ylabel('Population')
hold on;
plot(T,W);
legend('Wild boar','Wolves','location','northwest')

       
