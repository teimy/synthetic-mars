function [V1,spec]=AOTF(k_map,G4)
%c++++++++++Convolution with spicam PFS (frequency units)

    ao=load('calibr_hg_fm_19_05_ch-0_1529_wl.txt');
	N00=1;
    Nv0=length(G4);
	frmin=-40;
	frmax=40;
% 	v=1380;
	V1=7040:0.05:7360;
    Jmax=length(V1);
    spec=zeros(Jmax,1);
    for j=1:Jmax,
	  N0=N00;
      v=V1(j);
	  k=0;
      summ=0.0;
      tf=0.0;
      if (rem(j,1000)==1)
        j
      end    
        for i=N0:Nv0,
            if (k_map(i)<v+frmin),
            N00=i;
            end
            if (k_map(i)>=v+frmin&&k_map(i)<=v+frmax),
            k=k+1;
            ww(k)=(v-k_map(i));
            inten(k)=G4(i);
            end
            if (k_map(i)>v+frmax),
            break
            end
        end
  	    fn(k:-1:1)=interp1(ao(:,2),ao(:,3),ww(k:-1:1),'linear','extrap');
   
%             tf=tf+(inten(i-1)*fn(i-1)+inten(i)*fn(i))/2.*(ww(i)-ww(i-1));
            tf=sum((inten(1:end-1).*fn(1:end-1)+inten(2:end).*fn(2:end))/2.*(ww(2:end)-ww(1:end-1)));
%             sum=sum+(fn(i-1)+fn(i))/2.*(ww(i)-ww(i-1));  
            summ=sum((fn(1:end-1)+fn(2:end))/2.*(ww(2:end)-ww(1:end-1)));
%         MOD_RAD(j)=(tf+(G4(1)+G4(Nv0))/2*sum*0.05)/(sum+sum*0.05);
        spec(j)=tf/summ;
      end
%       spec=MOD_RAD;