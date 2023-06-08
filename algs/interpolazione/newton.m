function [x,k] = newton(fun,fund,x0,tau,kmax)
%function [x,k] = corde(fun,m,x0,tau,kmax)
%function [x,k] = secanti(fun,x0,x1,tau,kmax)

if abs(fun(x0))<tau
    x = x0;
    return;
end

if abs(fund(x0))<tau
    error('la derivata si annulla in x0!')
end

x_new = x0-(fun(x0)/fund(x0));
%x_new = x0 - (fun(x0)/m);
k = 1;
flag = 1;
while flag
    k = k+1;
    x0 = x_new;
    x_new = x0-(fun(x0)/fund(x0));
    %x_new = x0 - (fun(x0)/m);
    flag = (abs(x_new-x0) > abs(x0)*tau) && (abs(fun(x_new)) > tau) && (k<kmax);
end

if k>kmax
    fprintf('Num max di iterazioni raggiunto')
end

x = x_new;










