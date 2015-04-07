
[myT,myY]=ode45(@diffEq,[0 0.6],[1000/113.16 0.1 0.1 0.1 0.1],[],270+273,4,1000/113.16,0.1)
[myT2,myY2]=ode45(@diffEq,[0.6 5],[myY(end,1) myY(end,2) myY(end,3) myY(end,4) myY(end,5)],[],240+273,0.01,myY(end,1),myY(end,2))
mn=myY(:,4)./myY(:,3)*113
mw=myY(:,5)./myY(:,4)*113
mn2=myY2(:,4)./myY2(:,3)*113
mw2=myY2(:,5)./myY2(:,4)*113


figure('name','industrial results for mn=20000 and L<9%')
subplot(3,1,1)
plot(myT,mn,myT2,mn2)
title('mn')
xlabel('time')
ylabel('mn')
title('plot of mn. Note that it reaches 20k in under 5 hours')

subplot(3,1,2)
plot(myT,mw,myT2,mw2)
title('Mw')
xlabel('time')
ylabel('mw')

title('plot of mw')

subplot(3,1,3)
plot(myT,myY(:,1),myT2,myY2(:,1))
title('plot of caprolactam. Under 9% at 5 hours.')
xlabel('time')
ylabel('L')