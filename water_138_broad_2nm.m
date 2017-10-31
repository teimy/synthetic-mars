tic
clear

Intensity_re
HT=load('h2o_296k.txt');
load('map_of_trans.mat');
data_P
% data_Ro
data_T
data_N
% sinc_model
% global dataRo
global dataP
global dataT
global dataN
P0=10^5;
T0=296;
% n=20;
k_max=7400;
k_min=7000;
% T=220;
k_diff=6;
mu=18*10^-3;
R=8.31;
c=3*10^8;
k_int=zeros(1,length(k_map));
k_map=sort(k_map);
R_mars=3396.2;
k_sum=0;
Dl=3;
H=dataT(:,1);
%%%%%%%%%
AL2=log(2.);
SPI=sqrt(pi);
SPIAL2=sqrt(pi*AL2);
AL21=1.5/AL2+1.;

toc
for j1=1:1
%   Считывание профилей из MCD 
    j1
    tic
    T=0.5*(dataT(j1,2)+dataT(j1+1,2));
    P=0.5*(dataP(j1,2)+dataP(j1+1,2));
    n=0.5*(dataN(j1,2)+dataN(j1+1,2));
%     Ro_normal=n*10^(-6)*10^(-6)*P/(T*1.38*10^(-23));
    Ro=n*10^(-4)*P/(T*1.38*10^(-23));

for i=1:length(HT)
  %     Полуширины линий
      aL=(HT(i,6)); 
      n_c=(HT(i,9));
      aL=(T0/T)^(n_c)*(P/P0)*aL*1.7;     
      aD=(HT(i,3)/c)*sqrt(2*T*R/mu); % (ln(2))
      AV1=aL+sqrt(aL*aL+4*aD*aD);
      AV=0.5*AV1+0.05*(1.-2.*aL/AV1)*aL;
      AV2=AV*AV;
      SI=aL/AV;
      SI1=1.-SI;
    for j=1:length(k_map)
        if ((HT(i,3)>k_map(j)-k_diff)&&(HT(i,3)<k_map(j)+k_diff))
%            Расчет контура
             %lorentz=(aL/(pi))/((k_map(j)-HT(i,3))^2+aL^2);%*prof_koef;
            % doppler=exp(-(HT(i,3)-k_map(j))^2/aD^2)/(aD*sqrt(pi));%*prof_koef;
%              aD=aD*sqrt((log(2)));
             DW=abs(k_map(j)-HT(i,3));
             ET=DW/AV;
             ET2=ET*ET;
             if (ET<=10.),
                 k_int(j)=k_int(j)+S_cor(i,j1)*(SPIAL2*SI1*exp(-ET2*AL2)/aL/AV+1./(AV2+DW*DW)-SI1/AV2*(AL21+SI)*(0.066*exp(-0.4*ET2)-1./(40.-5.5*ET2+ET2*ET2)))*aL;
                 else
                 k_int(j)=k_int(j)+S_cor(i,j1)*aL/(AV2+DW*DW);
             end
  %            aF=(aD^5+2.69269*aD^4*aL+2.42843*aD^3*aL^2+4.47163*aD^2*aL^3+0.07842*aD*aL^4+aL^5)^(1/5);
 %            eta=1.36603*(aL/aF)-0.47719*(aL/aF)^2+0.11116*(aL/aF)^3;
%              eta=0;
         %    k_int(j)=k_int(j);
        end
    end
end
%  Расчет сечения поглощения
dl=H(j1+1)-H(j1);
k_int= 2.*k_int/pi*Ro*dl;
k_sum=k_sum+k_int;
% dl=10^5*(sqrt((R_mars+H_next)^2-R_mars^2)-sqrt((R_mars+H)^2- R_mars^2));
k_int=zeros(1,numel(k_int));
toc
end
%   tao_sum=2*sum(tao_int,1);
% lamda=71.22+1.367*10^8./f+1.369*10^-11./(f.^2);


% k_map=1./k_map;

G4=exp(-k_sum);
% plot(1./k_map, G4) - График со спектром, будет считать долго
