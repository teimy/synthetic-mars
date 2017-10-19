A_sum2=hitran2mat('hitran04.txt');
j=0;
for i=1:length(A_sum2)
    if ((A_sum2(i,2)==1)&&(A_sum2(i,4)>10^-26))
        j=j+1;
        trans_cor(j,1)=A_sum2(i,3);
        trans_cor(j,2)=A_sum2(i,4);
        trans_cor(j,4)=A_sum2(i,6);
        trans_cor(j,5)=A_sum2(i,9);
    end
end