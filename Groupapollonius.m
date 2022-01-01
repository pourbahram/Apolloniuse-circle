function [X,Y,Label,clustered_points]= Groupapollonius(peaks,nPeak,dis,n,X0)

peaks=peaks';
peaks=[peaks peaks(1)];
BM=[];
X=[];
Y=[];
Indexes=zeros(1,n);
DLP_Label1=[];
indices=zeros(1,n);
Label=[];
clustered_points={};
clustered_points_dist={};
M1=[];
intersect_point=[];
     for j=1:nPeak
              indices=[];
              dist_point=[];
                    for i=1:n
                        d=dis(peaks(j),i);
                        b=true;
                         for z=1:nPeak
                          if((dis(peaks(z),i))<d)
                           b=false;
                           end;
                           if((z~=j)&&((dis(peaks(z),i))==d))
%                                [intersect_point,intersect_indexes]=sort(d);
                          intersect_point=[intersect_point,d];
                           end;
                         end;
                      if (b==true)
                          indices=[indices,i];
                          dist_point=[dist_point,d];
                          Label(i)=i;
                          Label(i)=j;
                           M1(j,i)=max(dist_point);
                      end
                    end
                    
                [dist_point,Indexes]=sort(dist_point);
                
                indices=indices(Indexes);
                clustered_points(j,:)={clustered_points;indices};
                clustered_points_dist(j,:)={clustered_points_dist;dist_point};
               

 [M1,N1]=max(M1(j,:));
 BM =[BM;N1];                 
 k=dis(peaks(j),BM(j))./dis(peaks(j+1),BM(j));
 X1=X0(peaks(j),3);
 X2=X0(peaks(j+1),3);
 Cx=(X1-((k^2)* X2))./(1-(k^2));% tole markaz
 Y1=X0(peaks(j),4);
 Y2=X0(peaks(j+1),4);
 Cy= (Y1-((k^2)*Y2))./(1-(k^2));% arze markaz
 r=k*(sqrt((X1-X2)^2)+((Y1-Y2)^2))./(abs(1-(k^2)));
 t=0:0.1:6.3;
    
   XX=r.*sin(t)+Cx;
   YY=r.*cos(t)+Cy;
   X=[X XX];
   Y=[Y YY];
  end;
%   if (j>1)
% [CI ICI]=intersect( clustered_points(j,:), clustered_points(j+1,:));
%   end
DLP_Label1=Label;
%        DLP_Label1=[Indexes  Label];
       nm=size(DLP_Label1,1);
for i=1:nm
   Label(DLP_Label1(i,1))=DLP_Label1(i,1); 
end
Label=Label';
end