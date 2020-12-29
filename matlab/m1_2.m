%模拟扩散情况
tx=linspace(0,50,1000); 
ty=linspace(0,80,1000); 
ty=ty';
tz=1.0008.*10.*exp(-0.0202.*sqrt( (tx-25).^2+(ty-40).^2 ));


hold on 
subplot(1,2,1);
meshc(tx,ty,tz);
xlabel('x轴');
ylabel('y轴');
zlabel('绝对浓度');
%等高线图
subplot(1,2,2)
[C h]=contour(tx,ty,tz); 
clabel(C,h);
xlabel('x轴');
ylabel('y轴'); 
hold off
