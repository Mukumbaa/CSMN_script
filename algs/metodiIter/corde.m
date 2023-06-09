function [x,k]=corde(fun,m,x0,tol,kmax)


k=1;
x=x0-fun(x0)/m;
while k < kmax && abs(x-x0)>tol*max(1,abs(x))  && not(fun(x)==0)
    x0=x;
    x=x0-fun(x0)/m;
   
    k=k+1;
end
