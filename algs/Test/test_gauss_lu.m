
for n = 100:100:1000

    A= randi(100,n);
    A=A+n*eye(n);
    x=ones(n);
    b=A*x;
    [L,U]=gauss_lu(A);
    
    y=L\b;
    x1=U\y;

    err=norm(x1-x)/norm(x);
    cond=norm(A)*norm(inv(A));
    fprintf("Dimensione: %d -> err:%e   cond:%e",n,err,cond);

end