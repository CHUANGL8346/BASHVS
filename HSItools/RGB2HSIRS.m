function r = RGB2HSIRS(img)
%RGB2HSIRS 此处显示有关此函数的摘要
%   此处显示详细说明
img1 = cat(3, img(:, :, 3), img(:, :, 2), img(:, :, 1));
r = rgb2hsi(img1);
end

