function [C,d] = gauss_piv(A,b)

[m,n] = size(A);

if m~=n
    error('La matrice A non e'' quadrata')
end


[mb,nb] = size(b);

if mb~=m
    error('il vettore b ha la lunghezza sbagliata')
elseif nb ~= 1
    error('b non e'' un vettore')
end

if det(A) < 1e-14
    error('Matrice singolare')
end

for k = 1:n-1
    [~,pos] = max(abs(A(k:n,k)));
    l = pos+k-1;
    A([k l],:) = A([l k],:);
    b([k l]) = b([l k]);
    for i = k+1:n
        m = A(i,k)/A(k,k);
        A(i,:) = A(i,:)-m*A(k,:);
        b(i) = b(i) -m*b(k);
    end
end

C = A;
d = b;
