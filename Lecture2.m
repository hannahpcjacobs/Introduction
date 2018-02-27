N0=50E3
density=20
area=30528
K=density*area
r=0.48
N0=50E3 %Starting Population
r=0.48 %Growth Rate
t=10
dt=1
T=linspace(1,t,t/dt)
N=[N0]
n=N0
for Ti=T
    n=n+r*n*((K-n)/K)
    N=[N,n]
    Ti
end
T=[0,T]
plot(T,N)

%% Hunters
N0=50E3
r=0.48
hunting_effort=0.4 %%Stable population if this equals r
t=100
dt=1
T=linspace(1,t,t/dt)
N=[N0]
n=N0
H=hunting_effort*n
for Ti=T
    n=n+(r*n-H)
    H=hunting_effort*n
    N=[N,n]
end
T=[0,T]
plot(T,N)

%% Introduction of Wolves
N0=100
W0=25
r=0.48
c=0.01
d=0.24
e=0.005
t=100
dt=0.001
T=linspace(1,t,t/dt)
N=[N0]
W=[W0]
n=N0
w=W0
for Ti=T
    no=n;
    n=no+(r*no-c*w*no)*dt;
    w=w+(e*w*n-d*w)*dt;
    N=[N,n];
    W=[W,w];
    analytical_error=e*n-d*log(n)-r*log(w)+c*w;
end
T=[0,T]
plot(T,N)
xlabel('Time')
ylabel('Population')
hold on
plot(T,W)
legend('Boar','Wolves')
hold off
