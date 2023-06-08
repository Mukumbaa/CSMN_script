function [P,L,U] = gauss_palu(A)

[m,n] = size(A);

if m~=n
    error('La matrice A non e'' quadrata')
end

if det(A) < 1e-14
    error('Matrice singolare')
end

P = eye(n);
L = zeros(n);

for k = 1:n-1
    [~,pos] = max(abs(A(k:n,k)));
    l = pos+k-1;
    A([k l],:) = A([l k],:);
    L([k l],:) = L([l k],:);
    P([k l],:) = P([l k],:);
    for i = k+1:n
        m = A(i,k)/A(k,k);
        A(i,:) = A(i,:)-m*A(k,:);  
        L(i,k) = m;
    end
end

L = L+eye(n);
U = A;