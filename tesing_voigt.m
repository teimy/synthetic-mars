
 x=-18:0.001:18;
% x1=-30:0.01:30;
% plot(x,sinc_cm_model(x))
 aD=1.05*10^-2;
 aL=0.1;
 T0=296;P0=1;P=0.06;T=220;
 aL=(T0/T)^(n_c)*(P/P0)*aL*1.7; 
 doppler=10^-26*exp(-x.^2/aD^2)/(aD*sqrt(pi));%*prof_koef;
 lorentz=10^-26*(aL/pi)./((x).^2+aL^2);
 aV=1/2*(aL+sqrt(4*aD^2+aL^2))+0.05*(1-2*aL/(aL+sqrt(aL^2+4*aD^2)));
 eta=x/aV;
 ksi=aL/aV;
 voigt=10^-26*sqrt(log(2))/(sqrt(pi)*aV)*(1-ksi)*exp(-eta.^2*log(2))+10^-26/(pi*aV)*ksi*1./(1+eta.^2);
 plot(x,doppler,x,lorentz,x,voigt)