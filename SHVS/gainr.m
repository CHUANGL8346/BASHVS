function F =  gainr(M)
a=0.8; 
m=mean(M(:))/2;
[r,c]=size(M);
F=zeros(r,c);
for i=1:r
    for j=1:c
        if M(i,j)<m
            F(i,j) = 1./(1*(M(i,j)+30).^a);
        else
            F(i,j) = 1./(1*(M(i,j)+1).^a);
        end
    end
end
end