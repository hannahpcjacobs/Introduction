clearvars
clc
close all
%% analytical solution
N0=5000;
dt=0.1;
t=[1:dt:100];
r1=0.48;
r2=0.2;
N1=popucalc(t,r1,N0);
N2=popucalc(t,r2,N0);

%plotten met behulp van subplots
subplot(2,1,1);
x=t;
y1=N1;
plot(t,N1,'r--')                %-- voor dashed line r voor rood
subplot(2,1,2);
x=t;
y2=N2;
fig=plot(t,N2,'k:');            %x om kruisjes te plotten g om het groen te maken, : om puntjes te plotten, k voor zwart
saveas(fig,'boarpopulation.jpg')%figuur opslaan als jpeg

%andere manier van plotten: twee lijnen op 1 plot
plot(t,N1)
hold on
plot(t,N2)
xlabel('time')
ylabel('population')
title('boar population')
legend('r1=0.48','r2=0.2')
hold off

%% meshgrid plot of boar population varying r
N0=5000;
t=linspace(0,15,20);    % dimensies van t en r moeten niet gelijk zijn!
r=linspace(0.1,0.5,10);
[T ,R]=meshgrid(t,r);   %eerst meshgrid maken om dimensies juist te krijgen, x en y moet matrix zijn, geen array
N=N0*exp(T.*R);         %.* om paarsegwijze vermenigvuldiging te doen
mesh(t,r,N)

%% numerical solution
r=0.05;
N=zeros(1,100);
N(1)=5000;
dt=0.001;
tottime=100;
t=[0:dt:tottime];
for i=[1:1:numel(t)]
    dN(i+1)=dt*r*N(i);
    N(i+1)=N(i)+dN(i+1);
    t(i+1)=i*dt;   
end
plot(t,N)

%% Carrying capacity Analytical
N0=5000;
dt=0.5;
tottime=100;
t=[1:dt:tottime];
r=0.48;
K=1000000;
N=K./(1+(exp(r*t)*(N0-K))); % ./ want waarde K delen door elke waarde van array t?
plot(t,N)

%% Carrying capacity while Numerical
N0=5000;
N=N0;
dt=0.1;
t=0;
r=0.48;
K=1000000;

while N(numel(N))<0.999*K
   dN=dt*((r*(K-N(numel(N)))*N(numel(N)))/K);
   N=[N,N(numel(N))+dN];
   t=[t,t(numel(t))+dt];
end

plot(t,N)

%% Carrying capacity for Numerical

r=0.48;
K=10e6;
dt=0.1;
tottime=100;
t=[1:dt:tottime];
N=zeros(1,numel(t));
N(1)=5000;
for i=[1:1:numel(N)]
    if N(i)<0.99*K
        dN(i+1)=dt*((r*(K-N(i))*N(i))/K);
        N(i+1)=N(i)+dN(i+1);
        t(i+1)=t(i)+dt;
    else
        break
    end
end 
plot(t,N)

%% Hunting included
r=0.48;
N0=5000;
alfa=[0.8*r, r, 1.2*r]; %laat alfa variëren tussen 0.8*r, r, 1.2*r
dt=0.5;
t=[0:dt:10];
N=zeros(numel(alfa),numel(t));
N(:,1)=N0;
for i=[1:1:numel(alfa)]
    N(i,:)=N0*exp((r-alfa(i)).*t);
    plot(t,N(i,:))
    hold on
end

%% Boars and Wolves Numerical
r=0.48;  % growth rate boar pop
c=0.01; % %predated by wolves
d=0.24; % wolve mortality rate
e=0.005;% reproduction rate wolve per boar eaten
N0=100; % initial boar pop
W0=25;  % initial wolve pop


% run the program for a variety of timesteps between 0.001 and 1
timestep=logspace(-3,0,4); 
RMSE=zeros(1,numel(timestep));
for j=[1:1:numel(timestep)]
    dt=timestep(j);
    t=[0:dt:100];
    N=zeros(1,numel(t));
    N(1)=N0;
    W=zeros(1,numel(t));
    W(1)=W0;
    for i=[1:1:numel(t)]
        dN(i+1)=dt*(r*N(i)-c*W(i)*N(i));
        N(i+1)=N(i)+dN(i+1);
        dW(i+1)=dt*(e*W(i)*N(i+1)-d*W(i));
        W(i+1)=W(i)+dW(i+1);
        t(i+1)=t(i)+dt;   
    end
    H_true=-d*log(N0)+e*N0-r*log(W0)+c*W0;  
    H_mod=-d*log(N)+e*N-r*log(W)+c*W;
    RMSE(j)=LoktaVolterraRMSE(d,e,r,c,N0,W0,N,W);
end
plot(timestep,RMSE)
% plot(t,N)
% hold on 
% plot(t,W)
% hold off
% plot(N,W)


