testing_HAPI;
sinc_cm_profile;
x=-39:0.01:39;
% profile(:,2)=profile(end:-1:1,2);
yi = interp1(profile(:,2), profile(:,3), -39:0.01:39);
otstup=(length(HAPI)-length(x))/2;
% 45301
% x1=-30:0.01:30;
% plot(x,sinc_cm_model(x))
% aD=1.05*10^-2;
% doppler=10^-26*exp(-x1.^2/aD^2)/(aD*sqrt(pi));%*prof_koef;
PSF=cat(1,zeros(otstup,1),yi');
PSF=cat(1,PSF,zeros(1,otstup)');

tic
z=conv(HAPI(:,2),PSF,'same')/100;
% z1=conv(k_sum_d,PSF,'same')/100;
% z2=conv(k_sum_v,PSF,'same')/100;
toc
