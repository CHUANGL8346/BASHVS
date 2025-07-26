function r = HSV2RGBRS(img)
%HSV2RGBRS 此处显示有关此函数的摘要
%   此处显示详细说明
img1 = hsv2rgb(img);
r = cat(3, img1(:, :, 3), img1(:, :, 2), img1(:, :, 1));
end

