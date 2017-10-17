clear all
fileID = fopen('59c3cd1c.txt','r');
i=0;
m=1;
% 1- molecId 2- isotopID 3-nu 4- S 5- A 6-aL 7- aSelf 8- E 9- n_c 10-
% delta_air 
while (m>0)
    i=i+1;
    str=fgetl(fileID);
    if (strcmp(str,'-1')) 
        str
        break
    end
    A=sscanf(str, '%1d%1d %f %e %f %f %f %f %f %f /n',10);
   
 
    A_sum(:,i)=A';
end

A_sum=A_sum';
% Нужно обрезать по 68 элементов
fclose(fileID);%f %f.%10.3e.%f