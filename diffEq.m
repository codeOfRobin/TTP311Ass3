function [ dx ] = diffEq( t,x,temp,W0,L0,P0)
R=1.9858775

dx=zeros(5,1)
k=zeros(3,1)
kb=zeros(3,1)
Keq=zeros(3,1)
A0=[5.9874e5 ; 1.8942e10 ; 2.8558e9 ]
E0=[1.9880e4 ; 2.3271e4 ; 2.2845e4]
Ac=[4.3075e7 ; 1.2114e10 ; 1.6377e10]
Ec=[1.8806e4 ; 2.0670e4 ; 2.0107e4]
delH=[1.918e1 ; -5.9458e3 ; -4.0438e3]
delS=[-7.8846e0 ; 9.4374e-1 ; -6.9457e0]
for i=[1:1:3]
    k(i)=A0(i)*exp(-E0(i)/(R*temp))+ Ac(i) * exp(-Ec(i)/(R*temp)) * x(3)
    Keq(i)=exp((delS(i)/R)-(delH(i)/(R*temp)))
    kb(i)=k(i)/Keq(i)
end

W=W0+P0-x(3);


% x(6)=(x(5) * (2 * x(5) *x(3) - (x(4) * x(4))))/(x(4) * x(3))
% dx(1)=-k(1)*x(1)*W + kb(1)*x(2) - k(3)*x(2)*x(1) + kb(3)*(x(2)-x(3))
% dx(2)=k(1)*x(1)*W - kb(1)*x(3) - k(2)*x(2)*x(2) + kb(2)*W*(x(4)-x(2))

% dx(3)=k(1)*x(1)*W - kb(1)*x(3) - 2*k(2)*x(3)*x(2) + 2*kb(2)*(x(2)-x(3))*W - k(3)*x(3)*x(1) +kb(3)*x(3)                           
% dx(4)= k(1)*x(1)*W - kb(1)*x(3) + k(3)*x(1)*x(2)- kb(3)*(x(2)-x(3))
% dx(5)=k(1)*x(1)*W - kb(1)*x(3) + 2*k(2)*x(4)*x(4) + kb(2)*W*(x(4)-x(6))/3+ k(3)*x(1)*(x(2)+2*x(4))+ kb(3)*(x(2)-2*x(4)+x(3))                    
dx(1)= -k(1)*x(1)*W + kb(1)*x(2) -k(3)*x(3)*x(1) + kb(3)* (x(3)-x(2))
dx(2)= k(1)*x(1)*W - kb(1)*x(2) - 2*k(2)*x(3)*x(2) + 2*kb(2)*(x(3)-x(2)) -k(3)*x(2)*x(1) + kb(3)*x(2)
dx(3)= k(1)*x(1)*W - kb(1)*x(2) -k(2)*x(3)*x(3) +kb(2)*W*(x(4)-x(3))
dx(4)= k(1)*x(1)*W - kb(1)*x(2) + k(3)*x(1)*x(3) -kb(3)*(x(3)-x(2))
dx(5)=k(1)*x(1)*W- kb(1)*x(2) + 2*k(2)*x(4)*x(4) + kb(2)*W*(x(4)-( x(5)* (2*x(5)*x(3) - x(4)*x(4)) )/(x(3)*x(4)))/3 + k(3)*x(1)*(x(3)+2*x(4)) + kb(3)* (x(3)-2*x(4)+x(2))

end

