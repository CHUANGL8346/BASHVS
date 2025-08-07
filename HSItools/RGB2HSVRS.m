function r = RGB2HSVRS(img)

img1 = cat(3, img(:, :, 3), img(:, :, 2), img(:, :, 1));
r = rgb2hsv(img1);
end

