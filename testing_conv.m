x=3995:10/600:4005;
x1=3980:40/1200:4020;
aLt=7.635705757488408e-03;
y=(aLt/(pi))./((x-4000).^2+aLt.^2);%+0.5*(aLt/(pi))./((x-4004).^2+(aLt.^2));
% z=conv(y,profile(:,3),'same');
% z1=conv(profile(:,3),y,'same');
% coef=cumtrapz(profile(:,3),x);
% c=coef(end)-coef(1);
% m=length(y);
% n=length(profile(:,3));
% w=zeros(m+n-1,1);
% for k=1:m+n-1
%     w(k)=0;
%     for j = max(1,k+1-n): min(k,m)
%         w(k)=w(k)+profile(j,3)*y(k-j+1);
%     end
% end
% plot(x1,z,x1,w);
% z2=cumtrapz(abs(z).^2,x);
% z2(end)-z2(1)
% z3=cumtrapz(abs(y).^2,x);
% z3(end)-z3(1)
tf=zeros(numel(x),1);
for j=1:numel(x)-1
    for i=1:numel(x)-1
        tf(j)=tf(j)+(y(i)*sinc_cm_model(x(i)-x(j))+(y(i+1)*sinc_cm_model(x(i+1)-x(j))))/2*(x(i+1)-x(i));
    end
end
%  z2=cumtrapz(tf,x);
%  z2(end)-z2(1)
%  z3=cumtrapz(y,x);
%  z3(end)-z3(1)

 plot(x,y,x,tf);
