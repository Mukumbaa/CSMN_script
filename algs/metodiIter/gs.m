function [x,k] = gs(A,b,x0,tau,kmax)
D = diag(diag(A));
E = -tril(A,-1);
F = -triu(A,1);

B = (D-E)\F;
f = (D-E)\b;
x_new = B*x0 + f;
k = 1;

while (norm(x_new - x0) > tau*norm(x0)) && (k<kmax)
    x0 = x_new;
    x_new = B*x0 + f;
    k = k+1;
end
x = x_new;