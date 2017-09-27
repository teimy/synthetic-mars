N = 1e3;
%  N = 1e5;
t = linspace(-10,10,N);

x = t.*exp(-t.^2);
y = exp(-4*t.^2).*cos(t);
z = (t-2)./((t-2).^2+3^2);
w = exp(-3*t.^2).*exp(2i*t);

u = conv(x,y,'same')/N;
% u = conv(conv(conv(x,y,'same')/N,z,'same')/N,w,'same')/N;

plot(t,u,t,x,t,y)