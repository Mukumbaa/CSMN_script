function yy = lagrint(x,y,xx)

%help

%Lj(x) = ((x-x1)/(xj-x1))*((x-x2)/(xj-x2))*...*((x-xn)/(xj-xn))
%p(x) = y(1)*L0(x) + y(2)*L1(x) + ... + y(n)*Ln-1(x)

x = x(:);
y = y(:);

n = size(x,1);
den = zeros(n,1);

for j = 1:n
    den(j) = prod(x(j) - x([1:j-1,j+1:end]));
end

m = size(xx,1);
yy = zeros(m,1);

for i=1:m
    num = prod(xx(i)-x)./(xx(i)-x);
    L = num./den;
    yy(i) = y'*L;
end

plot(x,y,'or',xx,yy,'b-')
legend('dati da interpolare','polinomio interpolante')




