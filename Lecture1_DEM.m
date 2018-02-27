%% Plot1
N=11.35E6; %Equilibrium Population
N0=50E3; %Starting Population
r=logspace(log10(0.01),log10(0.05)); %Growth Rate
t=log(N/N0)./r;
plot(r,t)
semilogx(r,t);
xlabel('Growth Rate');
ylabel('Time');
title('Equilibrium Time');

%% Plot 2
N0=50E3 %Starting Population
r1=0.48 %Growth Rate 1
r2=0.2 %Grotwth Rate 2
t=linspace(0,100)
N1=log10(N0*exp(r1.*t))
N2=log10(N0*exp(r2.*t))
plot(t,N1)
hold on
plot(t,N2)
% semilogy(t,N1)
% semilogy(t,N2)
xlabel('Time')
ylabel('Log(Wild Boar Population)')
title('Wild Boar Population')
hold off

%% Introduction to Meshgrids
X=linspace(1,5,5)
Y=linspace(1,10,10)
Y=Y'
[V  W] =meshgrid(X,Y)
H=V+W
mesh(X,Y,H)

%% Meshgrid of the boars
r=logspace(log10(0.01),log10(0.05))
t=linspace(1,15,15)
N0=50E3
[V W]= meshgrid(r,t)
N=N0*exp(V.*W)
meshc(V,W,N)
xlabel('Growth Rate')
ylabel('Time')
zlabel('Boar Population')

%% Loops
k=0;
K=[];
for j=1:4
    k=k+j;
    K=[K,k]
end
%% Numerical Solution
N0=50E3 %Starting Population
r=0.4 %Growth Rate
t=0 %Setting initial time
n=N0 %setting initial population
T=[0] %creating the array
N=[N0] %creating the array
while n<11.35E6 %conditional statement for the loop
    t=t+1
    n=n+r*n
    T=[T,t]
    N=[N,n]
end
[row,cols]=size(T)
plot(T,N)
semilogy(T,N)
xlabel('Time (years)')
ylabel('Wild Boar Population')
title('Differences in Solutions')
hold on
tan=linspace(0,cols-1,cols)
Nan=N0*exp(r.*tan)
plot(tan,Nan)
legend('Numerical Solution','Analytical Solution')
hold off

%% DEM
load sierrademml.mat
imagesc(sierrademml)

%% Slope Calculation with a for loop
[rows,cols]=size(sierrademml);
dzdx=zeros(rows,cols);
dzdy=zeros(rows,cols);
r=30;
slope=zeros(rows,cols);
for i=2:rows-1
    for j=2:cols-1
        dzdx(i,j)=(sierrademml(i+1,j)-sierrademml(i-1,j))./(2*r);
        dzdy(i,j)=(sierrademml(i,j+1)-sierrademml(i,j-1))./(2*r);
    end
end
slopefor=sqrt(dzdx.^2+dzdy.^2);
imagesc(slopefor)

%% Slope Calculation with indexing
[rows,cols]=size(sierrademml);
dzdx=zeros(rows,cols);
dzdy=zeros(rows,cols);
r=30;
slope=zeros(rows,cols);
dzdx(2:rows-1,:)=(sierrademml(1:rows-2,:)-sierrademml(3:rows,:))/(2*r);
dzdy(:,2:cols-1)=(sierrademml(:,1:cols-2)-sierrademml(:,3:cols))/(2*r);
slopeind=sqrt(dzdx.^2+dzdy.^2);
imagesc(slopeind)