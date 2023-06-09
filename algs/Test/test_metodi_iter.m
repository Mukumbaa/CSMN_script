for n=100:100:1000
    A= randi(100,n);
    A=A+n*eye(n);
    x=ones(n);
    b=A*x;

    kmax=200;
    tol=1e-16;
    x0=zeros(n,1);

    [xj,~,Bj]=jacobi(A,b,tol,kmax,x0);
    [xgs,~,Bgs]=gs(A,b,tol,kmax,x0);

    errj=norm(xj-x)/norm(x);
    errgs=norm(xgs-x)/norm(x);
    rj=max(abs(eig(Bj)));
    rgs=max(abs(eig(Bgs)));

    fprintf("Dimensione %d \n" + ...
        "\t Jacobi-  err:%e  raggio:%f" + ...
        "\t GS-  err:%e  raggio:%f",n,errj,rj,errgs,rgs);

end