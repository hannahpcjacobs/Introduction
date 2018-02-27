Nb=50000;
Nhum=11000000;
r=0.4;
i=1;
T=[1];

Dt=0.1

for i=1:100 %numerisch
    N=Nb(i)*(1+r); 
    T=[T,i];
    i=i+1;
    Nb=[Nb, N];
end

%analytisch
An=linspace(1,i-1,i);
Nan=Nb.*exp(r.*An)


plot(T,Nb)
semilogy(T,Nb)
ylabel('Number of boars')
xlabel('Time')
hold on
plot(An,Nan)
