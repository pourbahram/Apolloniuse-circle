function [peaks,nPeak,k,neighbs,rho,delta,X,Y,Label,clustered_points, Finalgroups]=densityPeaks(n,p,tetha,X0)
    k=fix(p*n);
    dis=pdist2(X0,X0);
    [disFromNeighb,neighbs]=neighborhood(n,k,dis);
    rho=calculateRho(disFromNeighb,k);
    delta=calculateDelta(rho,dis);
    peaks=selectPeak(rho,delta,tetha);
    nPeak=size(peaks,1);
    [X,Y,Label,clustered_points]=Groupapollonius2(peaks,nPeak,dis,n,X0);
    Finalgroups=densityApollonius(peaks,nPeak,X,Y,Label,clustered_points,dis,X0,n)
end