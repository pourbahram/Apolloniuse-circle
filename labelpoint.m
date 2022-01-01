clear
clc
load dataset1\iris
[X0,T,n,d]=readData(iris);
scatter(X0(:,3),X0(:,4),15,'filled');
a=(1:n)'; 
b=num2str(a); 
z=cellstr(b);
t=text(X0(:,3),X0(:,4),z,'Color','magenta','FontSize',7);
% t(19).Color = 'red';
% t(19).FontSize = 7;
