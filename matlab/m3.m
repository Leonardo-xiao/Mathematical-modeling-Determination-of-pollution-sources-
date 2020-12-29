loc=xlsread('data2'); 
x3=loc(:,2);
y3=loc(:,3);
z3=loc(:,4); 
xydata=[x3,y3];
canshu0=[20 20 20 20 20 20];  %？
f=@(canshu0,xydata)1.0008.*(canshu0(1).*exp(-0.0202.*sqrt( (xydata(:,1)- canshu0(2)).^2+(xydata(:,2)-canshu0(3)).^2 ))+canshu0(4).*exp(-0.0202.*sqrt( (xydata(:,1)-canshu0(5)).^2+(xydata(:,2)- canshu0(6)).^2 )));
lb=zeros(1,6);
ub=[inf 50 80 inf 50 80]; 
canshu=lsqcurvefit(f,canshu0,xydata,z3,lb,ub) 
zhat=1.0008.*(canshu(1).*exp(-0.0202.*sqrt( (xydata(:,1)-canshu(2)).^2+(xydata(:,2)-canshu(3)).^2 ))+canshu(4).*exp(-0.0202.*sqrt( (xydata(:,1)-canshu(5)).^2+(xydata(:,2)- canshu(6)).^2 )));
mse=sum((zhat-z3).^2)./length(z3)	%mse 
[h p]=ttest2(z3,zhat,'Alpha',0.01) 
tx=linspace(0,50,1000); 
ty=linspace(0,80,1000);
ty=ty';
tz=1.0008.*(canshu(1).*exp(-0.0202.*sqrt( (tx-canshu(2)).^2+(ty- canshu(3)).^2 ))+canshu(4).*exp(-0.0202.*sqrt( (tx-canshu(5)).^2+(ty- canshu(6)).^2 )));
hold off 
hold on
subplot(1,2,1);
meshc(tx,ty,tz);
xlabel('x轴');
ylabel('y轴');
zlabel('绝对浓度'); 
subplot(1,2,2)
[C h]=contour(tx,ty,tz); 
clabel(C,h);
xlabel('x轴');
ylabel('y轴');
