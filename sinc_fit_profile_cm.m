x=3995:10/600:4005;
x1=3980:40/1200:4020;
aLt=7.635705757488408e-03;
y=(aLt/(pi))./((x-4000).^2+aLt.^2)+0.5*(aLt/(pi))./((x-4004).^2+(aLt.^2));
% 
% for tau=min(x)+10:0.01:max(x)-10
%     if 
% end
tau=x;
for i=1:601
    temp=y.*sinc_cm_model(x(i)-tau);
    z=cumtrapz(temp,tau);
    sum(i)=z(end)-z(1);
end
% sum=y.*sinc_cm_model(x-tau);
plot(tau,sum);

% plot(x,z*max(y)/max(z),'.',x,y);
