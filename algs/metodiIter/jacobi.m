function [x,k] = jacobi(A,b,x0,tau,kmax)

if (nargin < 5),kmax = 100;end
if (nargin < 4),tau = 1e-5;end
if (nargin < 3),x0 = zeros(size(b));end


D = diag(diag(A));
E = -tril(A,-1);
F = -triu(A,1);

B = D\(E+F);
f = D\b;
flag = 1;
k = 0;
x_new = x0;

while flag
    x0 = x_new;
    x_new = B*x0 + f;
    k = k+1;
    flag = (norm(x_new - x0) > tau*norm(x0)) && (k<kmax);
end
x = x_new;
    
