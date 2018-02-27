clearvars
clc
close all

load('E:\GRM3\data\sierrademml(1).mat');
imagesc(sierrademml)
colorbar
title ('DEM')

[X,Y] = size(sierrademml);
DelZX = zeros(X,Y);
DelZY = zeros(X,Y);
%%

DelZX(:,2:Y-1)=sierrademml(:,1:Y-2)-sierrademml(:,3:Y); 
DelZY(2:X-1,:)=sierrademml(1:X-2,:)-sierrademml(3:X,:);

r=20; %raster resolution (=?)
DelZXr=DelZX/(2*r);
DelZYr=DelZY/(2*r);

SquareX=DelZXr.^2;
SquareY=DelZYr.^2;

H=sqrt(SquareX+SquareY);
figure;imagesc(H)
colorbar
title ('Slope')
