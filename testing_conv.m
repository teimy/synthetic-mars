% ����� ���� ��� �������
% load('fitres.mat');
x=k_map;
y=k_sum_l;
y1=1;
tf=zeros(numel(x),1);
for j=1:numel(x)-1
    if (rem(j,500)==1) 
        j
        toc
        tic
    end
%   ���� �������, ��� ������� � spicam_service
    for i=1:numel(x)-1
        if (abs(x(i)-x(j))<17)    
            tf(j)=tf(j)+(y(i)*y1*sinc_cm_model(x(i)-x(j))+(y(i+1)*y1*sinc_cm_model(x(i+1)-x(j))))/2*(x(i+1)-x(i));
        end
    end
end
% figure
% plot(x,y,x,tf);
