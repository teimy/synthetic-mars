tic
load('trans_corrected.mat');
load('map_of_trans.mat');
data_P
data_Ro
data_T
% sinc_model
global dataRo
global dataP
global dataT
P0=10^5;
T0=290;
n=20;
k_max=7407;
k_min=6993;
% T=220;
k_diff=6;
mu=18*10^-3;
R=8.31;
c=3*10^8;
k_int=zeros(1,length(k_map));
k_map=sort(k_map);
R_mars=3396.2;
k_sum=0;
% c2=1.4387770;
Dl=3;
toc
for j1=1:1
    j1
    tic
    T=0.5*(dataT(j1,2)+dataT(j1+1,2));
    P=0.5*(dataP(j1,2)+dataP(j1+1,2));
%     Ro=dataRo(j1,2);%relative density 
    Ro_normal=n*10^(-6)*10^(-6)*P/(T*1.38*10^(-23));
    % Ro=Ro*n_ppb/(44*10^-3)*10^-6*6.23*10^23;%in 1/cm^3
    Ro=Ro_normal;
    H=dataT(j1,1);
    H_next=dataT(j1+1,1);
    

for i=1:length(trans_cor)
      aL=(trans_cor(i,3)); 
      n_c=(trans_cor(i,4));
      aL=(T/T0)^(n_c)*(P/P0)*aL*1.7;
       
      aD=(trans_cor(i,1)/c)*sqrt(2*T*R/mu);
    
%      aD=aL;
%     k_int(i,:)=S_cor(i,j1)/(aD*sqrt(pi))*exp(-(Vij-trans_cor(i,1)).^2/(aD)^2);
    for j=1:length(k_map)
        if ((k_map(j)>trans_cor(i,1)-k_diff)&&(k_map(j)<trans_cor(i,1)+k_diff))
           
          prof_koef=sinc_model(pi/2*(k_map(j)-trans_cor(i,1))/Dl);
          prof_koef=(sin(pi/2*(k_map(j)-trans_cor(i,1))/Dl)/(pi/2*(k_map(j)-trans_cor(i,1))/Dl))^2;
%              k_int(j)=k_int(j)+S_cor(i,j1)*(1/(pi*aL))*prof_koef;%/((k_map(j)-trans_cor(i,1))^2 +aL^2));
             k_int(j)=k_int(j)+S_cor(i,j1)*exp(-(trans_cor(i,1)-trans_cor(i,1))^2/aD^2)/(aD*sqrt(pi))*prof_koef;
        end
    end
    
end
dl=H_next-H;
k_int= 2*k_int*Ro*dl;
% max(k_int)
k_sum=k_sum+k_int;
% dl=10^5*(sqrt((R_mars+H_next)^2-R_mars^2)-sqrt((R_mars+H)^2- R_mars^2));
k_int=zeros(1,numel(k_int));
toc
end
%   tao_sum=2*sum(tao_int,1);
% lamda=71.22+1.367*10^8./f+1.369*10^-11./(f.^2);


%T - transmittance
k_map=1./k_map;
G=exp(-k_sum);

% F=smooth(G,10);
