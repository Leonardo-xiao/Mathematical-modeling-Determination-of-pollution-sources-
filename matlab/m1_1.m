
x1=[0 10 20 30 40 50 60	70 80 90 100];	
y1=[1 0.820 0.671 0.549	0.448 0.336 0.301 0.246 0.202 0.165 0.145];
y1=log(y1);				%转化为线性回归的方式进行求解
p=polyfit(x1,y1,1);     %输出多项式拟合（这里是线性拟合）的参数
a2=p(1);
a1=exp(p(2)); 
yhat=a1.*exp(a2.*x1);   %得到每个x对应下y的估计值
mse=sum((exp(y1)-yhat).^2)./length(y1);%求MSE值
[h p]=ttest(y1,yhat,'Alpha',0.05);%t检验并求p值
hold on
subplot(1,2,1); 
t1=0:100;               %画出拟合出来的函数
yhat=a1.*exp(a2.*t1);
hold on

plot(t1,yhat);
plot(x1,exp(y1),'*');   %画出给的点
xlabel('x轴');
ylabel('y轴');

canshu0=[a1 a2];

f=@(canshu0,x1)canshu0(1).*exp(canshu0(2).*x1); %直接在最小二乘准则下求解，这里是定义拟合函数的形式
canshu=lsqcurvefit(f,canshu0,x1,exp(y1));       %得到拟合的参数
yhat2=canshu(1).*exp(canshu(2).*x1);

mse=sum((exp(y1)-yhat2).^2)./length(y1);
[h, p]=ttest(y1,yhat2,'Alpha',0.01);
t1=0:100;
yhat2=canshu(1).*exp(canshu(2).*t1); 
subplot(1,2,2);
hold on 
plot(t1,yhat2); 
plot(x1,exp(y1),'*'); 
xlabel('x轴');
ylabel('y轴');
