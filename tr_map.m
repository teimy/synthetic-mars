load('trans_corrected.mat');%951,979
trans_cor=trans_cor(950:980,:);
% k_diff=0.25;
k_shag=0.002; % step every 0.2 cm^-1
c=1;
k_map=zeros(length(trans_cor),1);
for i=1:length(trans_cor)
%     for j=1:51
%         k_map(c)=trans_cor(i,1)+(j-26)*k_shag;
%         c=c+1;
%     end
    for j=1:100
        k_map(c)=trans_cor(i,1)+(j-300)*k_shag*20;
        c=c+1;
    end
    for j=101:200
        k_map(c)=trans_cor(i,1)+(j-300)*k_shag*5;
        c=c+1;
    end
    for j=201:400
        k_map(c)=trans_cor(i,1)+(j-300)*k_shag;
        c=c+1;
    end
    for j=401:500
        k_map(c)=trans_cor(i,1)+(j-300)*k_shag*5;
        c=c+1;
    end
    for j=501:600
        k_map(c)=trans_cor(i,1)+(j-300)*k_shag*20;
        c=c+1;
    end
end