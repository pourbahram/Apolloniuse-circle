clear
clc
% load iris;
 
 load dataset0\iris
[X0,T,n,d]=readData(iris);
c=size(unique(T),1);
X0=normalize(X0);
%% %________________________________________________________Parameters
p=15/100;  %The number of neighbors
%% %________________________________________________________Density Peak
tic
[peaks,nPeak,k1,neighbs,rho,delta,X,Y,Label,clustered_points, Finalgroups]=densityPeaks(n,p,c,X0);
toc
%% %_________________________________________________________Draw
 drawplot(X0,T,nPeak,peaks,rho,delta,X,Y);
%  BestMea=BestMeasure(T,Label);