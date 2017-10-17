A_sum1=hitran2mat('59c3cd1c.txt');
A_sum2=hitran2mat('f220_1.txt');
j=0;
for i=1:length(A_sum1)
    if (A_sum1(i,2)==1)
        j=j+1;
        A_summ1(j,:)=A_sum1(i,:);
    end
end
j=0;
for i=1:length(A_sum2)
    if (A_sum2(i,2)==1)
        j=j+1;
        A_summ2(j,:)=A_sum2(i,:);
    end
end

data_T
Q_hit
c2=1.4387770;
k=A_summ1(:,3);
S_ref=A_summ1(:,4);
% A=trans_cor(:,3);
% aL=trans_cor(:,4);
E=A_summ1(:,8);
% g1=trans_cor(:,6);
% g2=trans_cor(:,7);
T_ref=296;
T=220;
% T=220;

for j=1:1
    % �������� ������������� ����� �� ����� (j- ����� ����), ������ �����
    % �� Hitran
    Q=Q_hitran(T);
    Q_ref=Q_hitran(296);
    S_cor(:,j)=S_ref.*((Q_ref./Q).*exp(-c2.*E/T(j))./exp(-c2.*E/T_ref)).*(1-exp(-c2.*k/T(j)))./(1-exp(-c2.*k/T_ref));
end
plot(1./k,S_cor(:,1)-A_summ2(:,4),1./k,A_summ2(:,4));