fun = @(x) exp(x)-2;%funzione normale
fund = @(x) exp(x);%derivata
x0=2;
x1=0.11;

tol = 1e-8;
kmax = 2000;

[x,k] = corde(fun,fund(x0),x0,tol,kmax);
%[x,k] = secanti(fun,x0,x1,tol,kmax);
disp(k)
disp(x)
