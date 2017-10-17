% n1=zeros(100,1);
% n2=ones(100,1);
% n12=cat(1,n1,n2);
% n121=cat(1,n12,n1);
% x=0:10/99:10;
% n2x=cat(1,n1,exp(-x)');
% n2x1=cat(1,n2x,n1);
% z5=conv(n121,n2x1);
% z5=z5*(max(n2x1)/max(z5));
% plot(z5);
x=-18:0.01:18;
% x1=-30:0.01:30;
% plot(x,sinc_cm_model(x))
% aD=1.05*10^-2;
% doppler=10^-26*exp(-x1.^2/aD^2)/(aD*sqrt(pi));%*prof_koef;
PSF=cat(1,zeros(20850,1),sinc_cm_model(x)');
PSF=cat(1,PSF,zeros(1,20850)');

tic
z=conv(k_sum_l,PSF,'same')/100;
z1=conv(k_sum_d,PSF,'same')/100;
z2=conv(k_sum_v,PSF,'same')/100;
toc

% x=x;
% y=doppler;
% y1=1;
% tf=zeros(numel(x),1);
% tic
% for j=1:numel(x)-1
%     if (rem(j,500)==1) 
%         j
%         
%     end
% %   ���� �������, ��� ������� � spicam_service
%     for i=1:numel(x)-1
%         if (abs(x(i)-x(j))<17)    
%             tf(j)=tf(j)+(y(i)*y1*sinc_cm_model(x(i)-x(j))+(y(i+1)*y1*sinc_cm_model(x(i+1)-x(j))))/2*(x(i+1)-x(i));
%         end
%     end
% end
% toc