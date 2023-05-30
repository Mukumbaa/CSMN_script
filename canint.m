function yy = canint(x,y,xx)

x = x(:);
y = y(:);

n = length(x);

if length(x) ~= length(y)
    error('x e y hanno lunghezza diversa')
end

X = zeros(n);
for j = 1:n
    X(:,j) = x.^(j-1);
end

a = X\y;

%p = a0*x^0 + a1*x^1 + ... + an*x^n teoria
%p = a(1)*x^0 + a(2)*x^1 + ... + a(n)*x^(n-1) matlab

for i = 1:length(xx)
s = 0;
for k = 1:n
    s = s + a(k)*xx(i)^(k-1);
end
yy(i) = s;
end

plot(xx,yy,'b',x,y,'ro')

