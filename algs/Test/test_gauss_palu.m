for n=100:100:1000
    A= randi(100,n);
    A=A+n*eye(n);
    x=ones(n);
    b=A*x;
    [P,L,U]=gauss_palu(A);
    
    y=L\(P*b);
    x1=U\y;

    err=norm(x1-x)/norm(x);
    cond=norm(A)*norm(inv(A));
    fprintf("Dimensione: %d -> err:%e   cond:%e",n,err,cond);

end