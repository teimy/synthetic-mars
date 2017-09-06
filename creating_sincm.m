 profile_sinc
 par=0.1;
 k=1:-(1-par)/550:par;
k1=sincc(:,2).*k';
 k1=k1*(max(sincc(:,2))/max(k1));
 sinxxx=sincc(:,2);
 plot(sincc(:,1),k1,sincc(:,1),sincc(:,2))

