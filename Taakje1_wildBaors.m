Nb=50000;
Nhum=11000000;
r=0.4;
i=1;
T=[1];

while Nb(i)< Nhum
    N=Nb(i)*(1+r); 
        T=[T,i];
    i=i+1;
    Nb=[Nb, N];
end

plot(T,Nb)
xlabel('Number of boars')
ylabel('Time')

