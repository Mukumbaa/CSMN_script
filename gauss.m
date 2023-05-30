function [C,d] = gauss(A,b)

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
    for i = k+1:n
        m = A(i,k)/A(k,k);
        A(i,:) = A(i,:)-m*A(k,:);
        b(i) = b(i) -m*b(k);
    end
end

C = A;
d = b;







