function drawplot(X0,T,nPeak,peaks,rho,delta,X,Y)
subplot(2,2,1)
scatter(X0(:,1),X0(:,2),5)
hold on
for i=1:nPeak
    scatter(X0(peaks(i),1),X0(peaks(i),2),50,'filled')
    hold on
  
end

title('Groups-Highdensity')
 subplot(2,2,2)
    scatter(rho,delta,30,'k','filled');
    hold on
    for i=1:nPeak
        scatter(rho(peaks(i)),delta(peaks(i)),'filled');
        title ('Decision Graph')
        xlabel ('\rho')
        ylabel ('\delta')
        hold on
        
    end;
%      plot(X,Y)
  
subplot(2,2,3)
scatter(X0(:,1),X0(:,2),30,T,'filled')
title('Dataset')
subplot(2,2,4)

   for i=1:nPeak
     scatter(X0(:,1),X0(:,2),30,T,'filled')
     hold on
     scatter(X0(peaks(i),1),X0(peaks(i),2),50,'filled')
     hold on
     plot(X,Y)
     hold on
%      plot(X(i),Y(i))
%      hold on
     end;
 end