function r = HSV2RGBRS(img)

img1 = hsv2rgb(img);
r = cat(3, img1(:, :, 3), img1(:, :, 2), img1(:, :, 1));
end

