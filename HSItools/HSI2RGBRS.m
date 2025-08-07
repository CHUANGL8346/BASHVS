function r = HSI2RGBRS(img)

img1 = hsi2rgb(img);
r = cat(3, img1(:, :, 3), img1(:, :, 2), img1(:, :, 1));
end

