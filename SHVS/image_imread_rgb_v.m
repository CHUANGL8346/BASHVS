function [image,Cb,Cr] =  image_imread_rgb_v(Path)
img_0 = imread(Path);
YCbCr = rgb2ycbcr(img_0);
Y=YCbCr(:,:,1);
Cb=YCbCr(:,:,2);
Cr=YCbCr(:,:,3);
base=2;
img_r = double(Y);  
img_m = 255/(max(img_r(:))-min(img_r(:)))*(img_r-min(img_r(:))); 
image = img_m/255;
[m,n]=size(image);
pr = rem(m,base);
pc = rem(n,base);
if pr ~= 0
    image = padarray(image,[base-pr 0],'post');
    Cb = padarray(Cb,[base-pr 0],'post');
    Cr = padarray(Cr,[base-pr 0],'post');
end
if pc ~= 0
    image = padarray(image,[0 base-pc],'post');
    Cb = padarray(Cb,[0 base-pc],'post');
    Cr = padarray(Cr,[0 base-pc],'post');
end
end