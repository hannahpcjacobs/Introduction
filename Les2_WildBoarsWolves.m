clearvars
clc
close all

Nb=100;
Nw=20
r=0.48;
c=0.01
e=0.005
d=0.24
i=1;
T=1:100

for i=1:99 %numerisch
    N=Nb(i)*(1+r)-c*Nw(i)*Nb(i);
    W=Nw(i)*(1-d)+e*Nw(i)*N;
    i=i+1;
    Nb=[Nb, N];
    Nw=[Nw, W];
end

plot(T,Nb)
% semilogy(T,Nb)
ylabel('Number of boars')
xlabel('Time')
hold on
plot(T,Nw)

%% analitical to check
%combinatie set equations --> dt uit

