function r = RGB2HSIRS(img)

img1 = cat(3, img(:, :, 3), img(:, :, 2), img(:, :, 1));
r = rgb2hsi(img1);
end

