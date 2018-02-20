clearvars
clc
close all

%geen predator, weel voedsel --> evolutie op korte tijdschaal -->
%exponetial
%Human induced hunting in exponetional growth model
%Numerical

Nb=50000;
r=0.4;
i=1;
T=[1];
alfa=r*1.2
%als alfa=R --> functie=rechte
%van equilibrium --> unsustainable

for i=1:100 %numerisch
    N=Nb(i)*(1+(r-alfa)); 
    T=[T,i];
    i=i+1;
    Nb=[Nb, N];
end

plot(T,Nb)
% semilogy(T,Nb)
ylabel('Number of boars')
xlabel('Time')