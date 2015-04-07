[myT,myY]=ode45(@diffEq,[0 12],[1000/113.16 0.1 0.1 0.1 0.1],[],533,0.1,1000/113.16,0.1)


 
figure('name','Effect of temperature')

subplot(3,1,1)
plot(myT,myY(:,1));
title('concentration of caprolactam')
xlabel('time')
ylabel('L')
mn=myY(:,4)./myY(:,3)*113
mw=myY(:,5)./myY(:,4)*113
pdi=mw./mn
subplot(3,1,2)
plot(myT,mn);
title('number averaged molecular weight')
xlabel('time')
ylabel('mn')

subplot(3,1,3)
plot(myT,mw);
title('Weigth everaged molecular weight')
xlabel('time')
ylabel('Mw')


figure('name','pdi')

plot(myT,pdi)
xlabel('time')
ylabel('Poly Dispersity Index')


% plot(myT,myY(:,1),myT,mn,myT,mw)
% title('concentration of caprolactam, mn and mw')
% ylabel('concentration')
% xlabel('time')
% legend('L','mn','mw')

