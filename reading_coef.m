fileID=fopen('koef_h2o_spicamshort_h2012_wp17_2015','rb');
% fid=fopen('wavelength_spicamshort_h2o_h2012_wp17_2015.txt','rb');
k_temp=dlmread('wavelength_spicamshort_h2o_h2012_wp17_2015.txt');
k=[k_temp(2:end,1);k_temp(2:end,2);k_temp(2:end,3)];
A=fread(fileID,'float');
P=A(2:17);
T=A(19:31);
B=zeros(length(k),length(T),length(P));
for i=1:length(k)
    if (rem(i,10000)==1)
        i
    end
    for j=1:length(T)
        B(i,j,:)=A(32+(j-1)*length(P)+(i-1)*length(P)*length(T):32+(j)*length(P)+(i-1)*length(P)*length(T)-1);
    end
end
