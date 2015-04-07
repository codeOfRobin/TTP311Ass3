finalL=[]
finalmn=[]

goodTemp=[]
goodWater=[]
goodTime=[]
for temp=[250:5:270]
	for water=[0.1:1:5]
		for time=[6:1:10]
			[myT,myY]=ode45(@diffEq,[0 time],[1000/113.16 0.1 0.1 0.1 0.1],[],temp+273,water,1000/113.16,0.1)
			endingL=myY(end,1)
			mn=myY(:,4)./myY(:,3)*113
			endingmn=mn(end,1)
			[myT2,myY2]=ode45(@diffEq,[time 14.05],[myY(end,1) myY(end,2) myY(end,3) myY(end,4) myY(end,5)],[],240+273,0.01,myY(end,1),myY(end,2))
			mn=myY2(:,4)./myY2(:,3)*113
			if mn(end,1)>2e4 && myY2(end,1)<0.795  
				finalL=[finalL;myY2(end,1)]
				finalmn=[finalmn;mn(end,1)]
				goodTemp=[goodTemp;temp]
				goodWater=[goodWater;water]
				goodTime=[goodTime;time]
			end
		end
	end
end	


[finalmn goodTemp goodWater goodTime]

