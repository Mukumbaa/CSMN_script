x = linspace(-1,1,20)';  %equispaziati

n = 20;
k = (0:n)';
%x = cos((2*k+1)./(2*(n+1))*pi);%Chebychev


y = sin(2*pi*x);
%y = 1./(1+25.*x.^2);

xx = linspace(-1,1,1000)';%Valori random di test

%yyc = canint(x,y,xx);
yyl = lagrint(x,y,xx);