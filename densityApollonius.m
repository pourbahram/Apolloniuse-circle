function Finalgroups=densityApollonius(peaks,nPeak,X,~,Label,clustered_points,dis,X0,n)
peaks=peaks';
peaks=[peaks peaks(1)];
controlpoint=zeros(1,1);
circle_arraye=[];
circle_direct=[];
Finalgroups={};
% circle_density_direct=0;
% circle_direct_indirect=[];
circle_density=[];
circle_density_indirect=0;
circle_density_direct_indirect2=[];
   for j=1:nPeak
       [m,n]=size(clustered_points{j,2});
          for i=1:n
          %%rasme circle1
          TM=clustered_points{j,2};
          BM2=TM(1,i);
          k=dis(peaks(j),BM2)./dis(peaks(j+1),BM2);
          if(k~=0)
          X1=X0(peaks(j),1);
          X2=X0(peaks(j+1),1);
          Cx=(X1-((k^2)* X2))./(1-(k^2));% tole markaz
          Y1=X0(peaks(j),2);
          Y2=X0(peaks(j+1),2);
          Cy=(Y1-((k^2)*Y2))./(1-(k^2));% arze markaz
          r=k*(sqrt((X1-X2)^2)+((Y1-Y2)^2))./(abs(1-(k^2)));
          t=0:0.1:6.3;
          C=[Cx,Cy]; %create center point 
          BM_point_X=X0(BM2,1);
          BM_point_Y=X0(BM2,2);
          BM_point=[BM_point_X,BM_point_Y];
           DP1=pdist2(BM_point,C);
           DP2=dis(BM2,peaks(j));
            circle_density_indirect=0;
           for tt=1:n
               TM2=clustered_points{j,2};
               BM3=TM2(1,tt);
               kk=dis(peaks(j),BM3)./dis(peaks(j+1),BM3);
               if(kk~=0)
                    X1=X0(peaks(j),1);
                    X2=X0(peaks(j+1),1);
                    Cx2=(X1-((kk^2)* X2))./(1-(kk^2));% tole markaz
                    Y1=X0(peaks(j),2);
                    Y2=X0(peaks(j+1),2);
                    Cy2=(Y1-((kk^2)*Y2))./(1-(kk^2));% arze markaz
                    r2=kk*(sqrt((X1-X2)^2)+((Y1-Y2)^2))./(abs(1-(kk^2)));
                    t=0:0.1:6.3;
                    C2=[Cx2,Cy2]; %create center point 
                    BM_point_X2=X0(BM3,1);
                    BM_point_Y2=X0(BM3,2);
                    BM_point2=[BM_point_X2,BM_point_Y2];
                    DP1_ic=pdist2(BM_point2,C2);
                    DP2_ij=dis(BM3,peaks(j));  
                         if((DP2_ij<DP2)&&(DP1_ic<DP1))
%                             if(DP1_ic<DP1)
%                              if((DP2_ij<DP2))
                         circle_density_indirect=circle_density_indirect+1;
                        else
                          circle_density_direct=0;
                        end;
         
%           XX=r.*sin(t)+Cx;
%           YY=r.*cos(t)+Cy;
%           X=[X XX];
%           Y=[Y YY];
               end;
           end;
           circle_density_direct_indirect2=[circle_density_direct_indirect2,circle_density_indirect];
%   circle_density_indirect2=[circle_density_indirect2,circle_density_direct];
%  circle_direct_indirect=[circle_direct_indirect, circle_density_indirect];
                    
          %% rasme circle2 
        
          rr=dis(peaks(j),BM2);
          Cx3=X0(peaks(j),1);
          Cy3=X0(peaks(j),2);
          XX1=rr.*sin(t)+Cx3;
          YY1=rr.*cos(t)+Cy3;
          % agar dar in dayere data digar bod beshmar agar na 0 bezar to D_arraye
          % agar daron D_arraye bad afzayeshe density be 0 residim ono beriz to control point
%           X1=[X1 XX1];
%           Y1=[Y1 YY1];
%           C2(1)=Cx1;
%           C2(2)=Cy1;
%           DP2=pdist2(BM ,C2);
%           if(DP2<=rr)%faslei har data point az markaz circle be shoae (BM(i),j) 
%               circle2(j,i)=count(j,i)+1;
%           end
          
          %%rasme nime balla va paiine khate gozar az circle
%           t=0:0.1:3.1;
%           XX_half_up=r.*sin(t)+Cx;
%           YY_half_up=r.*cos(t)+Cy;

%           t=3.1:0.1:6.3;
%           XX_half_down=r.*sin(t)+Cx;
%           YY_half_down=r.*cos(t)+Cy;
         
            
      
      
%          density_circle=intersect(circle1,circle2);
%          if(density_circle==0)
%           direct_point(i)=0;
%          else
%            indirect_point(i)= density_circle;
        
         end;
   end;
%    circle_density=circle_density(circle_density_direct_indirect2);
   Finalgroups(j,:)={Finalgroups;circle_density_direct_indirect2};
   
end;