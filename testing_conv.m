x=3995:10/600:4005;
x1=3980:40/1200:4020;
aLt=7.635705757488408e-03;
y=(aLt/(pi))./((x-4000).^2+aLt.^2);%+0.5*(aLt/(pi))./((x-4004).^2+(aLt.^2));
z=conv(y,profile(:,3),'same');
% z1=conv(profile(:,3),y,'same');
coef=cumtrapz(profile(:,3),x);
c=coef(end)-coef(1);
    z=z;
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
 plot(x,y,x,z);