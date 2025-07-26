function S = fusion_contrast_s(x,a)
% x--结构显著性信息
% yv,yr--像素级信息
% a--分解层数

%% 结构显著性
r=[2,6,12,24,48,96];

S = gradient_f(x,r(a)); %结构显著性

end