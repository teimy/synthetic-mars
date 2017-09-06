w138long
amp_max=10^-26;
k_diff=0.5;
j=1;
k_shag=0.002; % step every 0.002 cm^-1
for i=1:numel(data2(:,1))
     if (data2(i,2)>amp_max)   
         trans_cor(j,:)=data2(i,:);
         j=j+1;
     end 
end
