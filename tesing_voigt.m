c1=1 ;
for j=5849:9600
        if ((k_map(j)>trans_cor(i,1)-k_diff)&&(k_map(j)<trans_cor(i,1)+k_diff))
             if (c1==1)
                 j
             end 
             ff(j)=k_map(j);
             lorentz(j)=S_cor(i,j1)*(aL/(pi))/((k_map(j)-trans_cor(i,1))^2+aL^2);%*prof_koef;
             doppler(j)=S_cor(i,j1)*exp(-(trans_cor(i,1)-k_map(j))^2/aD^2)/(aD*sqrt(pi));%*prof_koef;
%              aD=aD*sqrt((log(2)));
             aF=(aD^5+2.69269*aD^4*aL+2.42843*aD^3*aL^2+4.47163*aD^2*aL^3+0.07842*aD*aL^4+aL^5)^(1/5);
             eta=1.36603*(aL/aF)-0.47719*(aL/aF)^2+0.11116*(aL/aF)^3;
             c1=0;
        end
end
 
 foigt=eta*lorentz+(1-eta)*doppler;