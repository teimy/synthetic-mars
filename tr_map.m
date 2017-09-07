load('trans_corrected.mat');
k_diff=0.25;
k_shag=0.01; % step every 0.2 cm^-1
c=1;
for i=1:length(trans_cor)
    for j=1:25
        k_map(c)=trans_cor(i,1)+(j-13)*k_shag;
        c=c+1;
    end
end