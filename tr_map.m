load('trans_corrected.mat');
% k_diff=0.25;
k_shag=0.01; % step every 0.2 cm^-1
c=1;
k_map=zeros(length(trans_cor),1);
for i=1:length(trans_cor)
%     for j=1:51
%         k_map(c)=trans_cor(i,1)+(j-26)*k_shag;
%         c=c+1;
%     end
    for j=1:5
        k_map(c)=trans_cor(i,1)+(j-26)*k_shag*20;
        c=c+1;
    end
    for j=6:15
        k_map(c)=trans_cor(i,1)+(j-26)*k_shag*5;
        c=c+1;
    end
    for j=16:25
        k_map(c)=trans_cor(i,1)+(j-26)*k_shag;
        c=c+1;
    end
    for j=26:35
        k_map(c)=trans_cor(i,1)+(j-26)*k_shag;
        c=c+1;
    end
    for j=36:45
        k_map(c)=trans_cor(i,1)+(j-26)*k_shag*5;
        c=c+1;
    end
    for j=46:51
        k_map(c)=trans_cor(i,1)+(j-26)*k_shag*20;
        c=c+1;
    end
end