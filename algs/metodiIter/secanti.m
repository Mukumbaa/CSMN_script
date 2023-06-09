function [x,k]=secanti(fun,x0,x1,tol,kmax)
k=1;
x=(x0*fun(x1)-x1*fun(x0))/(fun(x1)-fun(x0));
while k < kmax && abs(x-x1)/max(1,abs(x))>tol
    x0=x1;
    x1=x;
    x=(x0*fun(x1)-x1*fun(x0))/(fun(x1)-fun(x0));
    k=k+1;
end