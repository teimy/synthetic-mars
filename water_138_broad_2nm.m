tic
Intensity_re
% load('trans_corrected.mat');
% load('map_of_trans.mat');
data_P%
% data_Ro
data_T%
data_N%
% sinc_model
% global dataRo
global dataP
global dataT
global dataN
P0=10^5;%
T0=296;%
% n=20;
% T=220;
k_diff=10;%
mu=18*10^-3;%
R=8.31;%
c=3*10^8;%
k_int=zeros(1,length(k_map));%
doppler_int=k_int;%
lorentz_int=k_int;%
voigt_int=k_int;
k_map=sort(k_map);
R_mars=3396.2;%
k_sum=0;%
k_sum_l=0;%
k_sum_d=0;
k_sum_v=0;%
H=dataT(:,1);%
toc
for j1=1:26
%   ���������� �������� �� MCD 
    j1
    tic
    T=0.5*(dataT(j1,2)+dataT(j1+1,2));% ��������
    P=0.5*(dataP(j1,2)+dataP(j1+1,2));% �������
    n=0.5*(dataN(j1,2)+dataN(j1+1,2));% Ppm-�
%     Ro_normal=n*10^(-6)*10^(-6)*P/(T*1.38*10^(-23));
    Ro=n*10^(-8)*P/(T*1.38*10^(-23));% cm^-3
    

for i=1:length(trans_cor)
%     ���������� �����
      aL=(trans_cor(i,4)); 
      n_c=trans_cor(i,5);
      aL=(T0/T)^(n_c)*(P/P0)*aL*1.7;     
      aD=(trans_cor(i,1)/c)*sqrt(2*T*R/mu);
      aV=1/2*(aL+sqrt(4*aD^2+aL^2))+0.05*(1-2*aL/(aL+sqrt(aL^2+4*aD^2)));
     
      ksi=aL/aV;
    for j=1:length(k_map)
        if ((abs(k_map(j)-trans_cor(i,1))<k_diff))
%            ������ �������
             eta=(k_map(j)-trans_cor(i,1))/aV;
%              lorentz=S_cor(i,j1)*(aL/pi)/((k_map(j)-trans_cor(i,1))^2+aL^2);%*prof_koef;
%              doppler=S_cor(i,j1)*exp(-(trans_cor(i,1)-k_map(j))^2/aD^2)/(aD*sqrt(pi));%*prof_koef;
             voigt=S_cor(i,j1)*sqrt(log(2))/(sqrt(pi)*aV)*(1-ksi)*exp(-eta.^2*log(2))+S_cor(i,j1)/(pi*aV)*ksi*1./(1+eta.^2);

             voigt_int(j)=voigt_int(j)+voigt;
%              lorentz_int(j)=lorentz_int(j)+lorentz;
%              doppler_int(j)=doppler_int(j)+doppler;
%              k_int(j)=k_int(j)+eta*lorentz+(1-eta)*doppler;
             
        end
    end
    
end

% 7.215007215007215e-01 2542
%  ������ ������� ����������
% 7.256894049346880e-01  3083
% Матвеев, 1972, Фойгт
dl=(H(j1+1)-H(j1))*100;
% k_int= 2*k_int*Ro*dl;
% k_sum=k_sum+k_int;
lorentz_int= 2*lorentz_int*Ro*dl;
k_sum_l=k_sum_l+lorentz_int;
doppler_int= 2*doppler_int*Ro*dl;
k_sum_d=k_sum_d+doppler_int;
voigt_int=2*voigt_int*Ro*dl;
k_sum_v=k_sum_v+voigt_int;
max(k_sum_v)
% dl=10^5*(sqrt((R_mars+H_next)^2-R_mars^2)-sqrt((R_mars+H)^2- R_mars^2));
k_int=zeros(1,numel(k_int));
doppler_int=k_int;
lorentz_int=k_int;
voigt_int=k_int;
toc
end
%   tao_sum=2*sum(tao_int,1);
% lamda=71.22+1.367*10^8./f+1.369*10^-11./(f.^2);


% k_map=1./k_map;

G4=exp(-k_sum);
% plot(1./k_map, G4) - ������ �� ��������, ����� ������� �����
