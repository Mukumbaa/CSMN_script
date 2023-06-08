function [L,U] = gauss_lu(A)

[m,n] = size(A);

if m~=n
    error('La matrice A non e'' quadrata')
end

if det(A) < 1e-14
    error('Matrice singolare')
end

L = zeros(n);

for k = 1:n-1
    for i = k+1:n
        m = A(i,k)/A(k,k);
        A(i,:) = A(i,:)-m*A(k,:);
        L(i,k) = m;
    end
end

L = L + eye(n);
U = A;
