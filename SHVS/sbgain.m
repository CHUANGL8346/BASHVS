function y = sbgain(x)
% x-输入基础层图像
% y-输出自适应基础层图像
[m,n] = size(x);
y = x;
l=128;

for i=1:m
    for j =1:n
        if x(i,j)<=l 
                y(i,j) = x(i,j)*gainv(x(i,j))/gainv(l);
        end
    end
end
t = 1;
b = fspecial('gaussian',[6*t+1,6*t+1],t);
y = imfilter(y,b,'replicate');
end