sinc_cm_profile;
x=-39:0.001:39;
% profile(end:-1:1,3);
%  x1=profile(:,2);
%  profile(:,3)=(sinc(x1/pi)).^2;
yi = interp1(profile(:,2), profile(:,3),x);
% 45301
% x1=-30:0.01:30;
% plot(x,sinc_cm_model(x))
% aD=1.05*10^-2;
% doppler=10^-26*exp(-x1.^2/aD^2)/(aD*sqrt(pi));%*prof_koef;
PSF=cat(1,zeros(187500,1),yi');
PSF=cat(1,PSF,zeros(1,187500)');

tic
z=conv(k_sum_l,PSF,'same')/1000;
z1=conv(k_sum_d,PSF,'same')/1000;
z2=conv(k_sum_v,PSF,'same')/1000;
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