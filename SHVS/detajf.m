function y = detajf(x,g,l) %噪声和强度饱和抑制
% x--输入图像
% g--参考图像，取源图像
% l--第l层图像


[m,n] = size(x);
y = x;

% 抑制强度饱和
for i = 1:m
    for j = 1:n
        if x(i,j)>0&&l>2
            y(i,j) = x(i,j)*(g(i,j).^1.5*0.7+0.3);
        end
    end
end
y(y>50)=50;
y(y<-50)=-50;

%抑制噪声
down = ((255-mean(255.*g(:)))/255)^2*4; 
if l==1
    y(abs(x)<down) = 0;
else
    if l==2
    down = down/2;
    y(abs(x)<down) = 0;
    end
end
end