function F = in_transducer(M,a)
    w = 22;
    u = 0.6;
    F = zeros(size(M));
    [m,n] = size(M);
    J = ones(m,n);
    J(M<=0) = -1;
    M = abs(M);
    for i = 1:m
        for j = 1:n
                if M(i,j) > w
                    F(i,j) = u*(M(i,j)/w)^2;
                else
                    F(i,j) = u*(M(i,j)/w)^(1/a);
                end
        end
    end
    F=F.*J;
end