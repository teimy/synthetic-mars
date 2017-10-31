% Пересчет Sij
data_T
% global data2
global dataT
HT=load('h2o_296k.txt');
for i=1:6,
    qu=load(['q',num2str(i),'.txt']);
    Q_hitran(:,i)=qu(:,2);
end
T=dataT(:,2);
c2=1.4387770;
%w138long;
S_cor(1:length(HT),1:35)=0;
% iso=HT(:,2);
k=HT(:,3);
S_ref=HT(:,4);
A=HT(:,5);
% aL=trans_cor(:,4);
E=HT(:,8);
g1=HT(:,6);
g2=HT(:,7);
T_ref=296;
% T=220;
for j=1:35
    j
    % Пересчет интенсивности линий по слоям (j- номер слоя), формул взята
    % из Hitran
    for k=1:length(HT),
    Q=interp1(1:length(Q_hitran),Q_hitran(:,HT(k,2)),T(j),'linear');
    Q_ref=Q_hitran(296,HT(k,2));
    S_cor(k,j)=S_ref(k).*((Q_ref./Q).*exp(-c2.*E(k)/T(j))./exp(-c2.*E(k)/T_ref)).*(1-exp(-c2.*k/T(j)))./(1-exp(-c2.*k/T_ref));
    end
end
