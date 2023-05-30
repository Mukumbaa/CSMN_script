function [x,k] = bisezione(fun,a,b,tau,kmax)

fa = fun(a);
fb = fun(b);

if fa*fb > 0
    error('La radice non e'' contenuta in [a,b]')
end

c = (a+b)/2;
fc = fun(c);
k = 1;

if abs(fc) < tau
    x = c;
    return
end


flag = 1;
while flag
if fa*fc < 0
    b = c;
    fb = fc;
else
    a = c;
    fa = fc;
end
k = k+1;
c = (a+b)/2;
fc = fun(c);

flag = (abs((b-a))>tau) && (abs(fc)>tau) && (k<kmax);
end

x = c;

if abs(fc)>tau
    if k>=kmax
        fprintf('Numero max di iterazioni raggiunto')
    end
end







