% load('trans_corrected.mat');%951,979

% % k_diff=0.25;
% k_shag=0.002; % step every 0.002 cm^-1
% c=1;
% n_k=121;
% k_map=zeros(length(trans_cor),1);
% for i=1:length(trans_cor)
% %     for j=1:51
% %         k_map(c)=trans_cor(i,1)+(j-26)*k_shag;
% %         c=c+1;
% %     end
%     for j=1:10
%         k_map(c)=trans_cor(i,1)+(j-60)*k_shag*20;
%         c=c+1;
%     end
%     for j=11:20
%         k_map(c)=trans_cor(i,1)+(j-60)*k_shag*5;
%         c=c+1;
%     end
%     for j=21:91
%         k_map(c)=trans_cor(i,1)+(j-60)*k_shag;
%         c=c+1;
%     end
%     for j=92:111
%         k_map(c)=trans_cor(i,1)+(j-60)*k_shag*5;
%         c=c+1;
%     end
%     for j=112:121
%         k_map(c)=trans_cor(i,1)+(j-60)*k_shag*20;
%         c=c+1;
%     end
% end

k_map=6974:0.001:7427;