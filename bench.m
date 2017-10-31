clear
x=0:0.001:1;
y=0;
tic
for i=2:length(x)
y=y+x(i)*x(i-1);
end
toc

clear
x=0:0.001:1;
tic
z=sum(x(1:end-1).*x(2:end));
toc