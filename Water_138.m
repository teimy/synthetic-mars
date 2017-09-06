tic
load('trans_corrected.mat');
load('map_of_trans.mat');
load('Intensivity.mat')
data_P
data_Ro
data_T
global dataRo
global dataP
global dataT
P0=10^5;
T0=290;
n=20;
k_max=7407;
k_min=6993;
T=220;
k_diff=0.5;
mu=18*10^-3;
R=8.31;
c=3*10^8;
k_int=zeros(1,length(k_map));
k_map=sort(k_map);
R_mars=3396.2;
k_sum=0;
c2=1.4387770;
toc
for j1=1:1
    j1
    trans_cor(:,2)=S_cor(:,j1);
    T=dataT(j1,2);
    P=dataP(j1,2);
    Ro=dataRo(j1,2);%relative density 
    Ro_normal=n*10^(-6)*10^(-6)*dataP(j1,2)/(dataT(j1,2)*1.38*10^(-23));
    % Ro=Ro*n_ppb/(44*10^-3)*10^-6*6.23*10^23;%in 1/cm^3
    Ro=Ro_normal;
    H=dataT(j1,1);
    H_next=dataT(j1+1,1);
    

for i=1:length(trans_cor)
      aL=(trans_cor(i,3)); 
      n_c=(trans_cor(i,4));
      aL=(T0/T)^(n_c)*(P/P0)*aL*1.7;
       
      aD=(trans_cor(i,1)/c)*sqrt(2*T*R/mu);
     
%      aD=aL;
%     k_int(i,:)=trans_cor(i,2)/(aD*sqrt(pi))*exp(-(Vij-trans_cor(i,1)).^2/(aD)^2);
    for j=1:length(k_map)
        if ((k_map(j)>trans_cor(i,1)-k_diff)&&(k_map(j)<trans_cor(i,1)+k_diff))
%             k_int(j)=k_int(j)+trans_cor(i,2)*(aL*(1/pi)/((k_map(j)-trans_cor(i,1))^2 +aL^2));
            k_int(j)=k_int(j)+trans_cor(i,2)*exp(-(k_map(j)-trans_cor(i,1))^2/aD^2)/(aD*sqrt(pi));
        end
    end
end
dl=H_next-H;
k_int= 2*k_int*Ro*dl;
% max(k_int)
k_sum=k_sum+k_int;
% dl=10^5*(sqrt((R_mars+H_next)^2-R_mars^2)-sqrt((R_mars+H)^2- R_mars^2));
k_int=zeros(1,numel(k_int));
end
%     tao_sum=2*sum(tao_int,1);

%T - transmittance
G=exp(-k_sum);

% F=smooth(G,10);
% Plans:
% Read file with water transitions on 1.38 band in range 
% 1350-1430nm and  done!
% construct a map for transitions и контуров поглощения 
% На один контур- 5 точек, хотя бы! Хотелось бы больше, 
% посмотрим потом.
% Думаю стоит запилить только Допплера, дальше посмотрим
% как пойдет, по идее нужен Фойгт