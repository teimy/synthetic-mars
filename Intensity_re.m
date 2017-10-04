% �������� Sij

data_T
Q_hit
% global data2
global dataT
load('trans_corrected.mat');
T=dataT(:,2);
c2=1.4387770;
w138long;
k=trans_cor(:,1);
S_ref=trans_cor(:,2);
% A=trans_cor(:,3);
% aL=trans_cor(:,4);
E=trans_cor(:,3);
% g1=trans_cor(:,6);
% g2=trans_cor(:,7);
T_ref=296;
% T=220;
for j=1:34
    % �������� ������������� ����� �� ����� (j- ����� ����), ������ �����
    % �� Hitran
    Q=Q_hitran(round((T(j)+T(j+1))/2));
    Q_ref=Q_hitran(296);
    S_cor(:,j)=S_ref.*((Q_ref./Q).*exp(-c2.*E/T(j))./exp(-c2.*E/T_ref)).*(1-exp(-c2.*k/T(j)))./(1-exp(-c2.*k/T_ref));
end