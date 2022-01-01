function BestMea=BestMeasure(T,DLP_Label1)
purity=Purity(T,DLP_Label1,2);
NMII = nmi(T,DLP_Label1);
RI =Calculate_Cluster_RandIndex(T,DLP_Label1);
BestMea=[purity,NMII,RI];
end